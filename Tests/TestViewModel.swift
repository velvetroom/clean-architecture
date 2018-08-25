import XCTest
@testable import CleanArchitecture

class TestViewModel:XCTestCase {
    private var viewModels:ViewModels!
    private var propertyA:MockViewModel!
    private var propertyB:MockSecondViewModel!
    
    override func setUp() {
        super.setUp()
        viewModels = ViewModels()
        propertyA = MockViewModel()
        propertyB = MockSecondViewModel()
    }
    
    func testUpdatesProperty() {
        let expect = expectation(description:"Observer not updated")
        let name = "hello world"
        viewModels.observe { (viewModel:MockViewModel) in
            XCTAssertEqual(viewModel.name, name, "Failed to update")
            expect.fulfill()
        }
        var property = MockViewModel()
        property.name = name
        viewModels.update(viewModel:property)
        waitForExpectations(timeout:1, handler:nil)
    }
    
    func testNotifyObserver() {
        var notified = false
        let expectNotified = expectation(description:"Observer not updated")
        let expectAfterCopy = expectation(description:"Observer not updated")
        let firstName = "hello world"
        let secondName = "lorem ipsum"
        viewModels.observe { (viewModel:MockViewModel) in
            if notified == false {
                notified = true
                expectNotified.fulfill()
                XCTAssertEqual(firstName, viewModel.name, "Invalid value")
            } else {
                expectAfterCopy.fulfill()
                XCTAssertEqual(secondName, viewModel.name, "Invalid value")
            }
        }
        propertyA.name = firstName
        viewModels.update(viewModel:propertyA)
        propertyA.name = secondName
        viewModels.update(viewModel:propertyA)
        waitForExpectations(timeout:1, handler:nil)
    }
    
    func testReplacesExistingPropertyOfSameType() {
        viewModels.update(viewModel:MockViewModel())
        viewModels.update(viewModel:MockViewModel())
        viewModels.update(viewModel:MockViewModel())
        viewModels.update(viewModel:MockViewModel())
        viewModels.update(viewModel:MockViewModel())
        viewModels.update(viewModel:MockViewModel())
        XCTAssertEqual(viewModels.items.count, 1, "Failed to replace")
    }
    
    func testUpdateObserver() {
        let expect = expectation(description:"Observer not updated")
        let view = MockView()
        view.startObserving()
        view.onPropertyUpdated = { expect.fulfill() }
        view.presenter.viewModels.update(viewModel:MockViewModel())
        waitForExpectations(timeout:1, handler:nil)
    }
    
    func testNotRetainingObserver() {
        let expect = expectation(description:"Observer not updated")
        let container = MockContainer()
        container.view = MockView()
        container.view?.startObserving()
        container.view?.onPropertyUpdated = { expect.fulfill() }
        container.view?.presenter.viewModels.update(viewModel:MockViewModel())
        container.view = nil
        XCTAssertNil(container.view, "Failed to release")
        waitForExpectations(timeout:1, handler:nil)
    }
    
    func testUpdatesObserverOnMainThread() {
        let expect = expectation(description:"Observer not updated")
        let view = MockView()
        view.startObserving()
        view.onPropertyUpdated = {
            XCTAssertEqual(Thread.current, Thread.main, "Not on main thread")
            expect.fulfill()
        }
        DispatchQueue.global(qos:.background).async {
            view.presenter.viewModels.update(viewModel:MockViewModel())
        }
        waitForExpectations(timeout:1, handler:nil)
    }
}
