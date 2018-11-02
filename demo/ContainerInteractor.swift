//
//  ContainerInteractor.swift
//  demo
//
//  Created by Maksim Vaniukevich on 7/7/18.
//  Copyright © 2018 Mapbox. All rights reserved.
//

import Foundation
import MapboxVision

enum Screen {
    case menu
    case signsDetection
    case segmentation
    case objectDetection
    case distanceToObject
    case map
    case laneDetection
    case arRouting
}

enum SafetyState {
    
    struct Warning {
        let frame: CGRect
        let objectType: ObjectType
    }
    
    case none
    case distance(frame: CGRect, distance: Double, canvasSize: CGSize)
    case warnings(values: [Warning], canvasSize: CGSize)
    case alert
}

struct SpeedLimitStatus {
    let sign: ImageAsset
    let isHighlighted: Bool
}

protocol ContainerPresenter: class {
    func presentVision()
    func present(screen: Screen)
    func presentBackButton(isVisible: Bool)
    
    func present(signs: [ImageAsset])
    func present(roadDescription: RoadDescription?)
    func present(safetyState: SafetyState)
    func present(laneDepartureState: LaneDepartureState)
    func present(calibrationProgress: CalibrationProgress?)
    
    func present(speedLimitStatus: SpeedLimitStatus?)
    
    func dismissMenu()
    func dismissCurrent()
}

protocol MenuDelegate: class {
    func selected(screen: Screen)
}

@objc protocol ContainerDelegate: class {
    func backButtonPressed()
}

private let signTrackerMaxCapacity = 5
private let speedLimitSeenInterval: Float = 5
private let speedLimitWarningThreshold: Double = 5 // mph
private let bonnetAdjustment = 1.25
private let collisionBeepDelay: TimeInterval = 3 // seconds

final class ContainerInteractor {
    
    private var currentScreen = Screen.menu
    private let presenter: ContainerPresenter
    private let visionManager: VisionManager
    
    private let signTracker = Tracker<SignValue>(maxCapacity: signTrackerMaxCapacity)
    private var signTrackerUpdateTimer: Timer?
    
    private let alertPlayer: AlertPlayer
    private var lastSafetyState = SafetyState.none
    private var lastSpeedLimit: SpeedLimitValue?
    
    private var hasBeepedForSpeedLimit = false
    private var hasBeepedForCollision = false
    
    private var beepResetTimer: Timer?
    
    struct Dependencies {
        let alertPlayer: AlertPlayer
        let presenter: ContainerPresenter
    }
    
    init(dependencies: Dependencies) {
        self.presenter = dependencies.presenter
        self.alertPlayer = dependencies.alertPlayer
        
        visionManager = VisionManager.shared
        visionManager.delegate = self
        visionManager.start()
        
        resetPerformance()
        
        presenter.presentBackButton(isVisible: false)
        presenter.presentVision()
        presenter.present(screen: .menu)
    }
    
    private func scheduleSignTrackerUpdates() {
        stopSignTrackerUpdates()
        
        signTrackerUpdateTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let `self` = self else { return }
            let signs = self.signTracker.getCurrent().compactMap { sign in
                return sign.icon(over: false, market: .us)
            }
            self.presenter.present(signs: signs)
        }
    }
    
    private func stopSignTrackerUpdates() {
        signTrackerUpdateTimer?.invalidate()
        signTracker.reset()
    }
    
    private func scheduleBeepReset() {
        beepResetTimer?.invalidate()
        beepResetTimer = Timer.scheduledTimer(withTimeInterval: collisionBeepDelay, repeats: false) { [weak self] _ in
            self?.hasBeepedForCollision = false
        }
    }
    
    private func resetPerformance() {
        let performance = ModelPerformance(mode: .fixed, rate: .low)
        visionManager.modelPerformanceConfig = .merged(performance: performance)
    }
    
    private func resetPresentation() {
        stopSignTrackerUpdates()
        alertPlayer.stop()
        presenter.present(signs: [])
        presenter.present(roadDescription: nil)
        presenter.present(laneDepartureState: .normal)
        presenter.present(safetyState: .none)
        presenter.present(calibrationProgress: nil)
    }
    
    deinit {
        visionManager.stop()
    }
}

extension ContainerInteractor: ContainerDelegate {
    
    func backButtonPressed() {
        presenter.dismissCurrent()
        presenter.presentBackButton(isVisible: false)
        presenter.present(screen: .menu)
        
        resetPresentation()
        resetPerformance()
        
        currentScreen = .menu
    }
}

extension ContainerInteractor: MenuDelegate {
    
    func selected(screen: Screen) {
        presenter.dismissCurrent()
        presenter.dismissMenu()
        
        switch screen {
        case .signsDetection:
            scheduleSignTrackerUpdates()
        case .distanceToObject:
            presenter.present(calibrationProgress: visionManager.calibrationProgress)
        default: break
        }
        
        let performance: ModelPerformance
        
        switch screen {
        case .signsDetection, .objectDetection, .segmentation:
            performance = ModelPerformance(mode: .fixed, rate: .high)
        case .distanceToObject, .laneDetection:
            performance = ModelPerformance(mode: .fixed, rate: .medium)
        case .map, .menu, .arRouting:
            performance = ModelPerformance(mode: .fixed, rate: .low)
        }
        
        visionManager.modelPerformanceConfig = .merged(performance: performance)
        
        presenter.present(screen: screen)
        presenter.presentBackButton(isVisible: true)
        currentScreen = screen
    }
}

extension ContainerInteractor: VisionManagerDelegate {
    func visionManager(_ visionManager: VisionManager, didUpdateLaneDepartureState laneDepartureState: LaneDepartureState) {
        guard case .laneDetection = currentScreen else { return }
        
        switch laneDepartureState {
        case .normal, .warning:
            alertPlayer.stop()
        case .alert:
            alertPlayer.play(sound: .laneDepartureWarning, repeated: true)
        }
        
        presenter.present(laneDepartureState: laneDepartureState)
    }
    
    func visionManager(_ visionManager: VisionManager, didUpdateSegmentation segmentation: SegmentationMask?) {
        
    }
    
    func visionManager(_ visionManager: VisionManager, didUpdateDetections detections: Detections?) {
        
    }
    
    func visionManager(_ visionManager: VisionManager, didUpdateSignClassifications classifications: SignClassifications?) {
        guard case .signsDetection = currentScreen, let items = classifications?.items.map({ $0.value }) else { return }
        signTracker.update(items)
    }
    
    func visionManager(_ visionManager: VisionManager, didUpdateRawRoadDescription roadDescription: RoadDescription?) {
    
    }
    
    func visionManager(_ visionManager: VisionManager, didUpdateRoadDescription roadDescription: RoadDescription?) {
        guard case .laneDetection = currentScreen else { return }
        presenter.present(roadDescription: roadDescription)
    }
    
    func visionManager(_ visionManager: VisionManager, didUpdateEstimatedPosition estimatedPosition: Position?) {
        
    }
    
    func visionManager(_ visionManager: VisionManager, didUpdateWorldDescription worldDescription: WorldDescription?) {
        
        var safetyState: SafetyState = .none
        
        defer {
            presenter.present(safetyState: safetyState)
            playCollisionAlert(for: safetyState)
        }
        
        guard case .distanceToObject = currentScreen, let worldDescription = worldDescription else { return }
        
        let supportedCollisionObjects = worldDescription.collisionObjects
            .filter { $0.object.detection.objectType.isSupportedForCollisionWarning }
        let hasCriticalState = supportedCollisionObjects.contains { $0.state == .critical }
        let warningCollisions = supportedCollisionObjects.filter { $0.state == .warning }.map { $0.object.detection }
        let forwardCar = worldDescription.getForwardCar()
       
        let shouldBeep = warningCollisions.contains { $0.objectType == .person } && !hasBeepedForCollision
        
        var hasJustBeeped = false
        
        if hasCriticalState {
            safetyState = .alert
            if shouldBeep {
                alertPlayer.play(sound: .collisionAlertCritical, repeated: false)
                hasJustBeeped = true
            }
        } else if warningCollisions.count > 0 {
            let warnings = warningCollisions.map { SafetyState.Warning(frame: $0.boundingBox, objectType: $0.objectType) }
            safetyState = .warnings(values: warnings, canvasSize: visionManager.frameSize)
            if shouldBeep {
                alertPlayer.play(sound: .collisionAlertWarning, repeated: false)
                hasJustBeeped = true
            }
        } else if let car = forwardCar {
            let distanceFromBonnet = max(0, car.distance - bonnetAdjustment)
            safetyState = .distance(frame: car.detection.boundingBox, distance: distanceFromBonnet, canvasSize: visionManager.frameSize)
            alertPlayer.stop()
        } else {
            alertPlayer.stop()
        }
        
        if hasJustBeeped {
            hasBeepedForCollision = true
            scheduleBeepReset()
        }
    }
    
    private func playCollisionAlert(for state: SafetyState) {
        guard !lastSafetyState.isEqualIgnoringPayload(state) else { return }
        
        lastSafetyState = state
    }
    
    func visionManager(_ visionManager: VisionManager, didUpdateCalibrationProgress calibrationProgress: CalibrationProgress) {
        guard case .distanceToObject = currentScreen else { return }
        presenter.present(calibrationProgress: calibrationProgress)
    }
    
    func visionManager(_ visionManager: VisionManager, didUpdateSpeedLimit speedLimit: SpeedLimitValue?) {
        guard
            case .distanceToObject = currentScreen,
            let speedLimit = speedLimit
        else {
            presenter.present(speedLimitStatus: nil)
            return
        }
        
        let isNewLimit: Bool
        let isNewSameLimit: Bool
        if let previousSpeedLimit = lastSpeedLimit {
            if speedLimit.sign != previousSpeedLimit.sign {
                isNewLimit = true
                isNewSameLimit = false
            } else {
                isNewLimit = false
                isNewSameLimit = speedLimit.lastSeen - previousSpeedLimit.lastSeen > speedLimitSeenInterval
            }
        } else {
            isNewLimit = true
            isNewSameLimit = false
        }
        
        if let image = speedLimit.sign.icon(over: speedLimit.isSpeeding, market: .us) {
            let isHighlighted = isNewLimit || isNewSameLimit
            let status = SpeedLimitStatus(sign: image, isHighlighted: isHighlighted)
            presenter.present(speedLimitStatus: status)
        } else {
            assertionFailure("Image for \(speedLimit.sign), isSpeeding: \(speedLimit.isSpeeding) is not found")
        }
        
        switch lastSafetyState {
        case .none, .distance:
            let mphSpeed = Measurement(value: Double(speedLimit.speed), unit: UnitSpeed.metersPerSecond)
                    .converted(to: .milesPerHour).value
            let isSpeedingThresholdExceeded = mphSpeed > speedLimit.sign.number + speedLimitWarningThreshold
            
            if !speedLimit.isSpeeding {
                hasBeepedForSpeedLimit = false
            }
            
            if isNewLimit {
                alertPlayer.play(sound: .newSpeedLimit, repeated: false)
                hasBeepedForSpeedLimit = isSpeedingThresholdExceeded
            } else if isSpeedingThresholdExceeded && !hasBeepedForSpeedLimit {
                alertPlayer.play(sound: .overSpeedLimit, repeated: false)
                hasBeepedForSpeedLimit = true
            }
        default: break
        }
        
        lastSpeedLimit = speedLimit
    }
}

private extension ObjectType {
    var isSupportedForCollisionWarning: Bool {
        switch self {
        case .lights, .sign:
            return false
        case .car, .person, .bicycle:
            return true
        }
    }
}

extension SafetyState {
    func isEqualIgnoringPayload(_ state: SafetyState) -> Bool {
        switch (self, state) {
        case (.none, .none), (.distance, .distance), (.warnings, .warnings), (.alert, .alert): return true
        case (.none, _), (.distance, _), (.warnings, _), (.alert, _): return false
        }
    }
}

extension SafetyState: Equatable {
    static func == (lhs: SafetyState, rhs: SafetyState) -> Bool {
        switch (lhs, rhs) {
        case (.none, .none), (.alert, .alert):
            return true
        case let (.distance(lframe, ldistance, lcanvasSize), .distance(rframe, rdistance, rcanvasSize)):
            return lframe == rframe && ldistance == rdistance && lcanvasSize == rcanvasSize
        case let (.warnings(lvalues, lcanvasSize), .warnings(rvalues, rcanvasSize)):
            return lvalues == rvalues && lcanvasSize == rcanvasSize
        case (.none, _), (.distance, _), (.warnings, _), (.alert, _):
            return false
        }
    }
}

extension SafetyState.Warning: Equatable {
    static func == (lhs: SafetyState.Warning, rhs: SafetyState.Warning) -> Bool {
        return lhs.frame == rhs.frame && lhs.objectType == rhs.objectType
    }
}

