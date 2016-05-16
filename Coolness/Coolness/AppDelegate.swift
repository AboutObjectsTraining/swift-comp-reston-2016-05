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

