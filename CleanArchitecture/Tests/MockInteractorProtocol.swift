import Foundation
import CleanArchitecture

class MockInteractorProtocol:InteractorProtocol {
    var onDidLoad:(() -> Void)?
    var presenter:InteractorDelegateProtocol?
    
    required init() { }
    
    func didLoad() {
        self.onDidLoad?()
    }
}
