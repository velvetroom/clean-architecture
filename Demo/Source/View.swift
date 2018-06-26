import UIKit
import CleanArchitecture

class View:CleanArchitecture.View<Interactor, Presenter, ViewContent> {    
    override func didLoad() {
        super.didLoad()
        self.title = NSLocalizedString("View_Title", comment:String())
    }
}
