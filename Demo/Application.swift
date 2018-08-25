import UIKit

@UIApplicationMain class Application:UIResponder, UIApplicationDelegate {
    var window:UIWindow?
    
    func application(_:UIApplication, didFinishLaunchingWithOptions:[UIApplication.LaunchOptionsKey:Any]?) -> Bool {
        let window = UIWindow(frame:UIScreen.main.bounds)
        window.backgroundColor = .white
        window.makeKeyAndVisible()
        window.rootViewController = DemoView()
        self.window = window
        return true
    }
}
