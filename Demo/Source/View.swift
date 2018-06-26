import UIKit

class View:UIViewController {
    init() {
        super.init(nibName:nil, bundle:nil)
        self.configureView()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureView() {
        self.title = NSLocalizedString("View_Title", comment:String())
    }
}
