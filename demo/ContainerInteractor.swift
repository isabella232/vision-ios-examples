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
    
    func dismissCurrent()
}

protocol MenuDelegate: class {
    func selected(screen: Screen)
}

@objc protocol ContainerDelegate: class {
    func backButtonPressed()
}

private let signTrackerMaxCapacity = 5
private let collisionAlertDelay: TimeInterval = 3 // seconds
private let speedLimitSeenInterval: Float = 5

private let speedLimitWarningThreshold: Double = 5 // mph
private let bonnetAdjustment = 1.25

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
    
    private var hasRecentlyPlayedCollisionAlert = false
    private var collisionAlertResetTimer: Timer?
    
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
        
        presenter.presentVision()
        present(screen: .menu)
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
    
    private func modelPerformanceConfig(for screen: Screen) -> ModelPerformanceConfig {
        switch screen {
        case .signsDetection, .objectDetection:
            return .merged(performance: ModelPerformance(mode: .fixed, rate: .high))
        case .segmentation:
            return .separate(segmentationPerformance: ModelPerformance(mode: .fixed, rate: .high),
                             detectionPerformance: ModelPerformance(mode: .fixed, rate: .low))
        case .distanceToObject, .laneDetection:
            return .merged(performance: ModelPerformance(mode: .fixed, rate: .medium))
        case .map, .menu, .arRouting:
            return .merged(performance: ModelPerformance(mode: .fixed, rate: .low))
        }
    }
    
    private func scheduleCollisionAlertReset() {
        collisionAlertResetTimer?.invalidate()
        collisionAlertResetTimer = Timer.scheduledTimer(withTimeInterval: collisionAlertDelay, repeats: false) { [weak self] _ in
            self?.hasRecentlyPlayedCollisionAlert = false
        }
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
    
    private func present(screen: Screen) {
        presenter.dismissCurrent()
        visionManager.modelPerformanceConfig = modelPerformanceConfig(for: screen)
        presenter.present(screen: screen)
        presenter.presentBackButton(isVisible: screen != .menu)
        currentScreen = screen
    }
    
    deinit {
        visionManager.stop()
    }
}

extension ContainerInteractor: ContainerDelegate {
    
    func backButtonPressed() {
        resetPresentation()
        present(screen: .menu)
    }
}

extension ContainerInteractor: MenuDelegate {
    
    func selected(screen: Screen) {
        switch screen {
        case .signsDetection:
            scheduleSignTrackerUpdates()
        case .distanceToObject:
            presenter.present(calibrationProgress: visionManager.calibrationProgress)
        default: break
        }
        
        present(screen: screen)
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
        guard case .distanceToObject = currentScreen, let worldDescription = worldDescription else {
            presenter.present(safetyState: .none)
            return
        }
        
        let state = SafetyState(worldDescription, canvasSize: visionManager.frameSize)
        
        switch state {
        case .none, .distance: break
        case .collisions(let collisions, _):
            let containsPerson = collisions.contains { $0.objectType == .person && $0.state == .critical }
            if containsPerson, !hasRecentlyPlayedCollisionAlert {
                alertPlayer.play(sound: .collisionAlertCritical, repeated: false)
                hasRecentlyPlayedCollisionAlert = true
                scheduleCollisionAlertReset()
            }
        }
        
        presenter.present(safetyState: state)
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
