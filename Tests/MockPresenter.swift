import Foundation
import CleanArchitecture

class MockPresenter:Presenter {
    var onDidLoad:(() -> Void)?
    var onWillAppear:(() -> Void)?
    var onDidAppear:(() -> Void)?
    
    override func didLoad() {
        onDidLoad?()
    }
    
    override func willAppear() {
        onWillAppear?()
    }
    
    override func didAppear() {
        onDidAppear?()
    }
}
