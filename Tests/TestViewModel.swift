import XCTest
@testable import CleanArchitecture

class TestViewModel:XCTestCase {
    private var viewModels:ViewModels!
    private var propertyA:MockViewModel!
    private var propertyB:MockSecondViewModel!
    
    override func setUp() {
        viewModels = ViewModels()
        propertyA = MockViewModel()
        propertyB = MockSecondViewModel()
    }
    
    func testUpdatesProperty() {
        let expect = expectation(description:String())
        viewModels.observe { (viewModel:MockViewModel) in
            XCTAssertEqual("hello world", viewModel.name)
            expect.fulfill()
        }
        var property = MockViewModel()
        property.name = "hello world"
        viewModels.update(viewModel:property)
        waitForExpectations(timeout:1, handler:nil)
    }
    
    func testNotifyObserver() {
        var notified = false
        let expectNotified = expectation(description:String())
        let expectAfterCopy = expectation(description:String())
        viewModels.observe { (viewModel:MockViewModel) in
            if notified == false {
                notified = true
                expectNotified.fulfill()
                XCTAssertEqual("hello world", viewModel.name)
            } else {
                XCTAssertEqual("lorem ipsum", viewModel.name)
                expectAfterCopy.fulfill()
            }
        }
        propertyA.name = "hello world"
        viewModels.update(viewModel:propertyA)
        propertyA.name = "lorem ipsum"
        viewModels.update(viewModel:propertyA)
        waitForExpectations(timeout:1, handler:nil)
    }
    
    func testNotifyObserverWithOptional() {
        let expect = expectation(description:String())
        viewModels.observe { (viewModel:MockViewModel) in
            expect.fulfill()
        }
        viewModels.update(viewModel:MockViewModel() as MockViewModel?)
        waitForExpectations(timeout:1, handler:nil)
    }
    
    func testReplacesExistingPropertyOfSameType() {
        viewModels.update(viewModel:MockViewModel())
        viewModels.update(viewModel:MockViewModel())
        viewModels.update(viewModel:MockViewModel())
        viewModels.update(viewModel:MockViewModel())
        viewModels.update(viewModel:MockViewModel())
        viewModels.update(viewModel:MockViewModel())
        XCTAssertEqual(1, viewModels.items.count)
    }
    
    func testUpdateObserver() {
        let expect = expectation(description:String())
        let view = MockView()
        view.startObserving()
        view.onPropertyUpdated = { expect.fulfill() }
        view.presenter.viewModels.update(viewModel:MockViewModel())
        waitForExpectations(timeout:1, handler:nil)
    }
    
    func testNotRetainingObserver() {
        let expect = expectation(description:String())
        let container = MockContainer()
        container.view = MockView()
        container.view?.startObserving()
        container.view?.onPropertyUpdated = { expect.fulfill() }
        container.view?.presenter.viewModels.update(viewModel:MockViewModel())
        container.view = nil
        XCTAssertNil(container.view)
        waitForExpectations(timeout:1, handler:nil)
    }
    
    func testUpdatesObserverOnMainThread() {
        let expect = expectation(description:String())
        let view = MockView()
        view.startObserving()
        view.onPropertyUpdated = {
            XCTAssertEqual(Thread.main, Thread.current)
            expect.fulfill()
        }
        DispatchQueue.global(qos:.background).async { view.presenter.viewModels.update(viewModel:MockViewModel()) }
        waitForExpectations(timeout:1, handler:nil)
    }
}
