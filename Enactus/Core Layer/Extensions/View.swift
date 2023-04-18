import UIKit

extension UIView {
    func rotate(duration: CFTimeInterval) {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.toValue = NSNumber(value: Double.pi * 2.0)
        animation.duration = duration
        animation.repeatCount = Float.infinity
        layer.add(animation, forKey: "rotationAnimation")
    }
}
