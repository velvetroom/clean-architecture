import UIKit

@UIApplicationMain class Application:UIResponder, UIApplicationDelegate {
    var window:UIWindow?
    
    func application(_:UIApplication, didFinishLaunchingWithOptions:[UIApplication.LaunchOptionsKey:Any]?) -> Bool {
        let window:UIWindow = UIWindow(frame:UIScreen.main.bounds)
        window.backgroundColor = UIColor.white
        window.makeKeyAndVisible()
        window.rootViewController = self.makeRouter()
        self.window = window
        return true
    }
    
    private func makeRouter() -> UINavigationController {
        let router:UINavigationController = UINavigationController()
        let view:DemoView = DemoView()
        view.presenter.interactor.router = router
        router.setViewControllers([view], animated:false)
        return router
    }
}
