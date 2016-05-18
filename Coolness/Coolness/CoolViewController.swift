import UIKit

let accessoryHeight: CGFloat = 66

class CoolViewController: UIViewController
{
    var contentView: CoolView!
    var textField: UITextField!
    
    func addCoolView()
    {
        let newCell = CoolViewCell()
        newCell.text = textField.text
        newCell.sizeToFit()
        contentView.addSubview(newCell)
    }
    
    override func loadView()
    {
        let frameRect = UIScreen.mainScreen().bounds
        view = UIView(frame: frameRect)
        
        let accessoryRect = CGRect(x: frameRect.minX, y: frameRect.minY, width: frameRect.width, height: accessoryHeight)
        let contentRect = CGRect(x: frameRect.minX, y: accessoryHeight, width: frameRect.width, height: frameRect.height - accessoryHeight)
        
        let accessoryView = UIView(frame: accessoryRect)
        contentView = CoolView(frame: contentRect)
        
        configureControls(accessoryView)
        
        view.addSubview(accessoryView)
        view.addSubview(contentView)
        
        view.backgroundColor = UIColor.brownColor()
        accessoryView.backgroundColor = UIColor(white: 1, alpha: 0.8)
        contentView.backgroundColor = UIColor(white: 1, alpha: 0.65)
    }
    
    func configureControls(accessoryView: UIView)
    {
        textField = UITextField(frame: CGRect(x: 8, y: 28, width: 240, height: 30))
        textField.borderStyle = .RoundedRect
        textField.placeholder = "Enter some text"
        textField.delegate = self
        
        let button = UIButton(type: .System)
        button.setTitle("Add", forState: .Normal)
        button.sizeToFit()
        
        button.addTarget(self, action: "addCoolView", forControlEvents: .TouchUpInside)
        
        button.frame.offsetInPlace(dx: 265, dy: 28)
        
        accessoryView.addSubview(textField)
        accessoryView.addSubview(button)
    }
}

extension CoolViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

