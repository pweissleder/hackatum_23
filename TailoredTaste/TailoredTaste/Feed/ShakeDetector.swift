import CoreMotion

class ShakeDetector: ObservableObject {
    private let motionManager = CMMotionManager()
    private let queue = OperationQueue()
    private var lastShakeTimestamp = Date()

    var onShake: () -> Void = {}

    init() {
        startMonitoring()
    }

    private func startMonitoring() {
        guard motionManager.isAccelerometerAvailable else { return }

        motionManager.accelerometerUpdateInterval = 0.1
        motionManager.startAccelerometerUpdates(to: queue) { [weak self] (data, error) in
            guard let data = data else { return }

            // Determine if the acceleration data represents a shake
            let acceleration = data.acceleration
            let totalAcceleration = sqrt(pow(acceleration.x, 2) + pow(acceleration.y, 2) + pow(acceleration.z, 2))

            if totalAcceleration > 2.5 { // Threshold for shake detection
                let now = Date()
                if now.timeIntervalSince(self?.lastShakeTimestamp ?? Date()) > 1 { // Avoid duplicate detections
                    DispatchQueue.main.async {
                        self?.onShake()
                    }
                    self?.lastShakeTimestamp = now
                }
            }
        }
    }

    deinit {
        motionManager.stopAccelerometerUpdates()
    }
}
