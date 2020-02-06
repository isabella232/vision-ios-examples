import Foundation
import MapboxVision

struct VisionBundle {
    let videoSource: VideoSource
    let visionManager: VisionManagerProtocol

    var ar: VisionARBundle = VisionARBundle()
    var safety: VisionSafetyBundle = VisionSafetyBundle()
}

struct VisionARBundle {

}

struct VisionSafetyBundle {

}

class VMObserver {
    private let sessionsManager = ReplaySessionManager()

    func isReplayAvailable() -> Bool {
        return sessionsManager.sessions.count > 0
    }

    func observe() -> VisionBundle {
        let sessionsManager = ReplaySessionManager()

        if let session = sessionsManager.sessions.first,
            let replayManager = try? VisionReplayManager.create(recordPath: session.path.path)
        {
            let videoSource = replayManager.videoSource
            return VisionBundle(videoSource: videoSource, visionManager: replayManager)
        } else {
            let camera = CameraVideoSource()
            let visionManager = VisionManager.create(videoSource: camera)
            return VisionBundle(videoSource: camera, visionManager: visionManager)
        }
    }
}
