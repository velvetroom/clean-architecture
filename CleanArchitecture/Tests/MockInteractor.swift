import Foundation
import CleanArchitecture

class MockInteractor:Interactor {
    var onDidLoad:(() -> Void)?
    var delegate:InteractorDelegate?
    
    required init() { }
    
    func didLoad() {
        self.onDidLoad?()
    }
}
