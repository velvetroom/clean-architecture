import Foundation
import CleanArchitecture

class MockView:View<MockPresenterProtocol, MockUIView> {
    var onPropertyUpdated:(() -> Void)?
    
    func startObserving() {
        self.presenter.viewModel.observe { (property:MockViewModelProtocol) in
            self.onPropertyUpdated?()
        }
    }
}
