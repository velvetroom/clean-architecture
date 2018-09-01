import Foundation
import CleanArchitecture

class MockView:View<MockInteractor, MockPresenter> {
    var onPropertyUpdated:(() -> Void)?
    
    func startObserving() {
        presenter.viewModels.observe { (_:MockViewModel) in
            self.onPropertyUpdated?()
        }
    }
}
