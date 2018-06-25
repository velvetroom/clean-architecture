import XCTest
@testable import CleanArchitecture

class TestView_ViewModel:XCTestCase {
    func testInjectsViewModelWithPresenter() {
        let presenter:MockPresenterProtocol = PresenterFactory.makePresenter()
        let view:MockView = MockView(presenter:presenter)
        XCTAssertNotNil(view.presenter.viewModel, "Not injected")
    }
    
    func testInjectsViewModelWithoutPresenter() {
        let view:MockView = MockView()
        XCTAssertNotNil(view.presenter.viewModel, "Not injected")
    }
}
