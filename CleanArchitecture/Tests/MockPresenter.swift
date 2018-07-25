import Foundation
import CleanArchitecture

class MockPresenter:Presenter {
    var onDidLoad:(() -> Void)?
    var onWillAppear:(() -> Void)?
    var onDidAppear:(() -> Void)?
    var interactor:MockInteractor!
    var viewModels:ViewModels!
    
    required init() { }
    
    func didLoad() {
        self.onDidLoad?()
    }
    
    func willAppear() {
        self.onWillAppear?()
    }
    
    func didAppear() {
        self.onDidAppear?()
    }
}
