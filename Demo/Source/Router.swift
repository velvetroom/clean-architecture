import UIKit

class Router:UINavigationController {
    init() {
        super.init(nibName:nil, bundle:nil)
        let view:View = View()
        view.presenter.interactor.router = self
        self.setViewControllers([view], animated:false)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
