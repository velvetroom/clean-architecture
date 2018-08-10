import XCTest
@testable import CleanArchitecture

class TestView:XCTestCase {
    func testInjectsDependencies() {
        let view:MockView = MockView()
        XCTAssertNotNil(view.presenter, "Not injected")
        XCTAssertNotNil(view.presenter.interactor, "Not injected")
        XCTAssertNotNil(view.presenter.interactor.delegate, "Not injected")
        XCTAssertNotNil(view.presenter.viewModels, "Not injected")
    }
    
    func testCallsPresenterOnViewDidLoad() {
        let presenter:MockPresenter = MockPresenter()
        presenter.interactor = MockInteractor()
        let view:MockView = MockView(presenter:presenter)
        var called:Bool = false
        presenter.onDidLoad = { called = true }
        view.viewDidLoad()
        XCTAssertTrue(called, "Not called")
    }
    
    func testCallsInteractorOnViewDidLoad() {
        let presenter:MockPresenter = MockPresenter()
        presenter.interactor = MockInteractor()
        let view:MockView = MockView(presenter:presenter)
        var called:Bool = false
        presenter.interactor.onDidLoad = { called = true }
        view.viewDidLoad()
        XCTAssertTrue(called, "Not called")
    }
    
    func testCallsPresenterOnViewWillAppear() {
        let presenter:MockPresenter = MockPresenter()
        let view:MockView = MockView(presenter:presenter)
        var called:Bool = false
        presenter.onWillAppear = { called = true }
        view.viewWillAppear(false)
        XCTAssertTrue(called, "Not called")
    }
    
    func testCallsPresenterOnViewDidAppear() {
        let presenter:MockPresenter = MockPresenter()
        let view:MockView = MockView(presenter:presenter)
        var called:Bool = false
        presenter.onDidAppear = { called = true }
        view.viewDidAppear(false)
        XCTAssertTrue(called, "Not called")
    }
}
