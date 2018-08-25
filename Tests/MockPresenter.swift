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
        onDidLoad?()
    }
    
    func willAppear() {
        onWillAppear?()
    }
    
    func didAppear() {
        onDidAppear?()
    }
}
