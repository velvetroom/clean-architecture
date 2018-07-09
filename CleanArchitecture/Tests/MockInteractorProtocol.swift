import Foundation
import CleanArchitecture

class MockInteractorProtocol:InteractorProtocol {
    var onDidLoad:(() -> Void)?
    var presenter:InteractorDelegateProtocol?
    var transition:MockTransitionProtocol?
    
    required init() { }
    
    func didLoad() {
        self.onDidLoad?()
    }
}
