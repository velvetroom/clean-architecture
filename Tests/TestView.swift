import XCTest
@testable import CleanArchitecture

class TestView:XCTestCase {
    func testInjectsDependencies() {
        let view = MockView()
        XCTAssertNotNil(view.presenter, "Not injected")
        XCTAssertNotNil(view.presenter.interactor, "Not injected")
        XCTAssertNotNil(view.presenter.interactor.delegate, "Not injected")
        XCTAssertNotNil(view.presenter.viewModels, "Not injected")
    }
    
    func testCallsPresenterOnViewDidLoad() {
        let presenter = MockPresenter()
        presenter.interactor = MockInteractor()
        let view = MockView(presenter:presenter)
        var called = false
        presenter.onDidLoad = { called = true }
        view.viewDidLoad()
        XCTAssertTrue(called, "Not called")
    }
    
    func testCallsInteractorOnViewDidLoad() {
        let presenter = MockPresenter()
        presenter.interactor = MockInteractor()
        let view = MockView(presenter:presenter)
        var called = false
        presenter.interactor.onDidLoad = { called = true }
        view.viewDidLoad()
        XCTAssertTrue(called, "Not called")
    }
    
    func testCallsPresenterOnViewWillAppear() {
        let presenter = MockPresenter()
        let view = MockView(presenter:presenter)
        var called = false
        presenter.onWillAppear = { called = true }
        view.viewWillAppear(false)
        XCTAssertTrue(called, "Not called")
    }
    
    func testCallsPresenterOnViewDidAppear() {
        let presenter = MockPresenter()
        let view = MockView(presenter:presenter)
        var called = false
        presenter.onDidAppear = { called = true }
        view.viewDidAppear(false)
        XCTAssertTrue(called, "Not called")
    }
}
