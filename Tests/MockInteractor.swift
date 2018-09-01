import Foundation
import CleanArchitecture

class MockInteractor:Interactor {
    var onDidLoad:(() -> Void)?
    var delegate:Delegate?
    
    required init() { }
    
    func didLoad() {
        onDidLoad?()
    }
}
