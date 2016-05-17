import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?

    func application(application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        let frameRect = UIScreen.mainScreen().bounds
        
        window = UIWindow(frame: frameRect)
        
        window?.rootViewController = CoolViewController()
        window?.backgroundColor = UIColor.yellowColor()
        window?.makeKeyAndVisible()
        
        return true
    }
}

//extension AppDelegate
//{
//    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        guard let touch = touches.first, view = touch.view else { return }
//        view.panBy(dx: touch.deltaX, dy: touch.deltaY, constrainedTo: CGRect.infinite)
//    }
//}
