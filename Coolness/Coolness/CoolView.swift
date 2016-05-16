import UIKit

private let cellRect = CGRect(x: 20, y: 20, width: 90, height: 30)

class CoolView: UIView
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        configure()
    }

    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        configure()
    }
    
    func configure()
    {
        addCoolViews()
    }
    
    func addCoolViews()
    {
        let cell1 = CoolViewCell(frame: cellRect)
        let cell2 = CoolViewCell(frame: cellRect.offsetBy(dx: 20, dy: 40))
        let cell3 = CoolViewCell(frame: cellRect.offsetBy(dx: 40, dy: 80))
        
        addSubview(cell1)
        addSubview(cell2)
        addSubview(cell3)
        
        cell1.backgroundColor = UIColor.purpleColor()
        cell2.backgroundColor = UIColor.orangeColor()
        cell3.backgroundColor = UIColor.blueColor()
    }
}
