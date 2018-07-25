import Foundation
import CleanArchitecture

class MockInteractor:Interactor {
    var onDidLoad:(() -> Void)?
    var presenter:InteractorDelegate?
    
    required init() { }
    
    func didLoad() {
        self.onDidLoad?()
    }
}
