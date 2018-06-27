import UIKit

class Navigation:UINavigationController, TransitionProtocol {
    init() {
        super.init(nibName:nil, bundle:nil)
        let view:View = View()
        view.transition = self
        self.setViewControllers([view], animated:false)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
