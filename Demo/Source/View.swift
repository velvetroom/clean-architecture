import UIKit
import CleanArchitecture

class View:CleanArchitecture.View<Interactor, Presenter, UIView> {    
    override func didLoad() {
        super.didLoad()
        self.title = NSLocalizedString("View_Title", comment:String())
    }
}
