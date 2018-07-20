import XCTest
@testable import CleanArchitecture

class TestView:XCTestCase {
    func testInjectsDependencies() {
        let view:MockView = MockView()
        XCTAssertNotNil(view.presenter, "Not injected")
        XCTAssertNotNil(view.presenter.interactor, "Not injected")
        XCTAssertNotNil(view.presenter.interactor.presenter, "Not injected")
        XCTAssertNotNil(view.presenter.viewModel, "Not injected")
    }
    
    func testViewContent() {
        let view:MockView = MockView()
        let content:MockUIView? = view.view as? MockUIView
        XCTAssertNotNil(content, "Invalid content type")
    }
    
    func testCallsPresenterOnViewDidLoad() {
        let presenter:MockPresenterProtocol = MockPresenterProtocol()
        presenter.interactor = MockInteractorProtocol()
        let view:MockView = MockView(presenter:presenter)
        var called:Bool = false
        presenter.onDidLoad = { called = true }
        view.viewDidLoad()
        XCTAssertTrue(called, "Not called")
    }
    
    func testCallsInteractorOnViewDidLoad() {
        let presenter:MockPresenterProtocol = MockPresenterProtocol()
        presenter.interactor = MockInteractorProtocol()
        let view:MockView = MockView(presenter:presenter)
        var called:Bool = false
        presenter.interactor.onDidLoad = { called = true }
        view.viewDidLoad()
        XCTAssertTrue(called, "Not called")
    }
    
    func testCallsPresenterOnViewWillAppear() {
        let presenter:MockPresenterProtocol = MockPresenterProtocol()
        let view:MockView = MockView(presenter:presenter)
        var called:Bool = false
        presenter.onWillAppear = { called = true }
        view.viewWillAppear(false)
        XCTAssertTrue(called, "Not called")
    }
    
    func testCallsPresenterOnViewDidAppear() {
        let presenter:MockPresenterProtocol = MockPresenterProtocol()
        let view:MockView = MockView(presenter:presenter)
        var called:Bool = false
        presenter.onDidAppear = { called = true }
        view.viewDidAppear(false)
        XCTAssertTrue(called, "Not called")
    }
    
    func testInjectContentWithPresenter() {
        let presenter:MockPresenterProtocol = MockPresenterProtocol()
        let view:MockView = MockView(presenter:presenter)
        XCTAssertNotNil(view.content, "Not injected")
    }
    
    func testInjectContentWithoutPresenter() {
        let view:MockView = MockView()
        XCTAssertNotNil(view.content, "Not injected")
    }
}
