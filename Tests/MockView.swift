import Foundation
import CleanArchitecture

class MockView:View<MockPresenter> {
    var onPropertyUpdated:(() -> Void)?
    
    func startObserving() {
        presenter.viewModel { (_:MockViewModel) in
            self.onPropertyUpdated?()
        }
    }
}
