import UIKit

let textOrigin = CGPoint(x: 12, y: 6)
let textAttributes = [
    NSFontAttributeName: UIFont.boldSystemFontOfSize(18),
    NSForegroundColorAttributeName: UIColor.whiteColor()
]

class CoolViewCell: UIView
{
    var highlighted: Bool = false {
        willSet { alpha = newValue ? 0.5 : 1.0 }
    }
    
    var text: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayer()
        configureGestureRecognizer()
    }
    
    func configureGestureRecognizer() {
        let recognizer = UILongPressGestureRecognizer(target: self, action: "animate:")
        addGestureRecognizer(recognizer)
    }
    
    func configureLayer() {
        layer.borderWidth = 2
        layer.borderColor = UIColor.whiteColor().CGColor
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Gesture Recognition and Animation

private let moveSize = CGSize(width: 120, height: 240)
private let animationDuration = 1.0

extension CoolViewCell
{
    func animate(recognizer: UILongPressGestureRecognizer)
    {
        guard recognizer.state == .Began else { return }
        animateMove(size: moveSize)
    }
    
    func animateMove(size size: CGSize)
    {
        UIView.animateWithDuration(animationDuration, animations: { self.configureMoveAnimation(size) }) { _ in
            self.animateMoveCompletion()
        }
    }
    
    func animateMoveCompletion() {
        UIView.animateWithDuration(animationDuration) { self.transform = CGAffineTransformIdentity }
    }
    
    func configureMoveAnimation(size: CGSize) {
        UIView.setAnimationRepeatCount(7.5)
        UIView.setAnimationRepeatAutoreverses(true)
        let xform = CGAffineTransformMakeTranslation(size.width, size.height)
        transform = CGAffineTransformRotate(xform, CGFloat(M_PI_2))
    }
}


// MARK: - UIViewGeometry

extension CoolViewCell
{
    override func sizeThatFits(size: CGSize) -> CGSize
    {
        guard let text = text else { return size }
        var newSize = (text as NSString).sizeWithAttributes(textAttributes)
        newSize.width += textOrigin.x * 2
        newSize.height += textOrigin.y * 2
        return newSize
    }
}


// MARK: - UIViewDrawing

extension CoolViewCell
{
    override func drawRect(rect: CGRect)
    {
        guard let text = text else { return }
        
        (text as NSString).drawAtPoint(textOrigin, withAttributes: textAttributes)
    }
}


// MARK: - UIResponder

extension CoolViewCell
{
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let touch = touches.first, view = touch.view, owningView = view.superview else { return }
        owningView.bringSubviewToFront(view)
        highlighted = true
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
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
