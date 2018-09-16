import XCTest
@testable import CleanArchitecture

class TestView:XCTestCase {
    func testInjectsDependencies() {
        let view = MockView()
        XCTAssertNotNil(view.presenter)
    }
    
    func testCallsPresenterOnViewDidLoad() {
        var called = false
        let presenter = MockPresenter()
        presenter.onDidLoad = { called = true }
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
