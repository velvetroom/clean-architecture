import XCTest
@testable import CleanArchitecture

class TestView:XCTestCase {
    func testInjectsDependencies() {
        let view = MockView()
        XCTAssertNotNil(view.presenter)
        XCTAssertNotNil(view.presenter.interactor)
        XCTAssertNotNil(view.presenter.interactor.delegate)
    }
    
    func testCallsPresenterOnViewDidLoad() {
        var called = false
        let presenter = MockPresenter()
        presenter.interactor = MockInteractor()
        presenter.onDidLoad = { called = true }
        MockView(presenter:presenter).viewDidLoad()
        XCTAssertTrue(called)
    }
    
    func testCallsInteractorOnViewDidLoad() {
        var called = false
        let presenter = MockPresenter()
        presenter.interactor = MockInteractor()
        presenter.interactor.onDidLoad = { called = true }
        MockView(presenter:presenter).viewDidLoad()
        XCTAssertTrue(called)
    }
    
    func testCallsPresenterOnViewWillAppear() {
        var called = false
        let presenter = MockPresenter()
        presenter.onWillAppear = { called = true }
        MockView(presenter:presenter).viewWillAppear(false)
        XCTAssertTrue(called)
    }
    
    func testCallsPresenterOnViewDidAppear() {
        var called = false
        let presenter = MockPresenter()
        presenter.onDidAppear = { called = true }
        MockView(presenter:presenter).viewDidAppear(false)
        XCTAssertTrue(called)
    }
}
