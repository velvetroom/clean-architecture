import Foundation
import CleanArchitecture

class MockView:View<MockPresenter> {
    var onPropertyUpdated:(() -> Void)?
    
    func startObserving() {
        self.presenter.viewModels.observe { (property:MockViewModel) in
            self.onPropertyUpdated?()
        }
    }
}
