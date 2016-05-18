import UIKit

let accessoryHeight: CGFloat = 66

class CoolViewController: UIViewController
{
    @IBOutlet var contentView: CoolView!
    @IBOutlet var textField: UITextField!
    
    
    // TODO: Try loading from nib
    
    @IBAction func addCoolView()
    {
        let newCell = CoolViewCell()
        newCell.text = textField.text
        newCell.sizeToFit()
        contentView.addSubview(newCell)
    }
}


extension CoolViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


// MARK: - Loading Nib Files

extension CoolViewController
{
    func loadView2()
    {
        NSBundle.mainBundle().loadNibNamed("CoolStuff", owner: self, options: nil)
    }
    
    func loadView1()
    {
        let topLovelObjs = NSBundle.mainBundle().loadNibNamed("CoolStuff", owner: nil, options: nil)
        print(topLovelObjs)
        view = topLovelObjs.first as! UIView
    }
}
