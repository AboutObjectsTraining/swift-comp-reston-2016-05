import UIKit

extension UITouch
{
    var deltaX: CGFloat { return locationInView(view).x - previousLocationInView(view).x }
    var deltaY: CGFloat { return locationInView(view).y - previousLocationInView(view).y }
}

extension UIView
{
    func panBy(dx dx: CGFloat, dy: CGFloat, constrainedTo rect: CGRect)
    {
        if rect.contains(frame.offsetBy(dx: dx, dy: CGFloat(0))) { center.x += dx }
        if rect.contains(frame.offsetBy(dx: CGFloat(0), dy: dy)) { center.y += dy }
    }
}

class CoolViewCell: UIView
{
    var highlighted: Bool = false {
        willSet { alpha = newValue ? 0.5 : 1.0 }
    }
}


// MARK: - UIResponder

extension CoolViewCell
{
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        guard let touch = touches.first, view = touch.view, owningView = view.superview else { return }
        
        owningView.bringSubviewToFront(view)
        highlighted = true
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        guard let touch = touches.first, view = touch.view, owningView = view.superview else { return }
        
        view.panBy(dx: touch.deltaX, dy: touch.deltaY, constrainedTo: owningView.bounds)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        reset()
    }
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        reset()
    }
    
    func reset() {
        highlighted = false
    }
}