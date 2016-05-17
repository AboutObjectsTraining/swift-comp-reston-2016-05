import UIKit

extension UITouch
{
    func deltaXInView(view: UIView) -> CGFloat { return locationInView(view).x - previousLocationInView(view).x }
    func deltaYInView(view: UIView) -> CGFloat { return locationInView(view).y - previousLocationInView(view).y }
}

extension CGRect
{
    mutating func offsetInPlace(dx dx: CGFloat, dy: CGFloat, constrainedTo otherRect: CGRect) {
        if otherRect.contains(offsetBy(dx: dx, dy: CGFloat(0))) { origin.x += dx }
        if otherRect.contains(offsetBy(dx: CGFloat(0), dy: dy)) { origin.y += dy }
    }
}

class CoolViewCell: UIView
{
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        guard let touch = touches.first, view = touch.view, let owningView = view.superview else { return }
        
        view.frame.offsetInPlace(dx: touch.deltaXInView(view), dy: touch.deltaYInView(view), constrainedTo: owningView.bounds)
    }
}
