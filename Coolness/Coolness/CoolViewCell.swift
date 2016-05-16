import UIKit

class CoolViewCell: UIView
{
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        guard let touch = touches.first, view = touch.view else { return }
        
        let currLocation = touch.locationInView(view)
        let prevLocation = touch.previousLocationInView(view)

        view.center.x += currLocation.x - prevLocation.x
        view.center.y += currLocation.y - prevLocation.y
    }
}
