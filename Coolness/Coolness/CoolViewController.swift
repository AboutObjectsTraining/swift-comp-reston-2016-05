import UIKit

let accessoryHeight: CGFloat = 66

class CoolViewController: UIViewController
{
    // TODO: Add contentView property
    
    override func loadView()
    {
        let frameRect = UIScreen.mainScreen().bounds
        view = UIView(frame: frameRect)
        
        let accessoryRect = CGRect(x: frameRect.minX, y: frameRect.minY, width: frameRect.width, height: accessoryHeight)
        let contentRect = CGRect(x: frameRect.minX, y: accessoryHeight, width: frameRect.width, height: frameRect.height - accessoryHeight)
        
        let accessoryView = UIView(frame: accessoryRect)
        let contentView = CoolView(frame: contentRect)
        
        view.addSubview(accessoryView)
        view.addSubview(contentView)
        
        view.backgroundColor = UIColor.brownColor()
        accessoryView.backgroundColor = UIColor(white: 1, alpha: 0.8)
        contentView.backgroundColor = UIColor(white: 1, alpha: 0.65)
    }
}
