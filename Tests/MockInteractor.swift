import Foundation
import CleanArchitecture

class MockInteractor:Interactor {
    var onDidLoad:(() -> Void)?
    
    override func didLoad() {
        onDidLoad?()
    }
}
