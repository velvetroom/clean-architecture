import XCTest
@testable import CleanArchitecture

class TestViewModel:XCTestCase {
    private var viewModels:ViewModels!
    private var propertyA:MockViewModel!
    private var propertyB:MockSecondViewModel!
    
    override func setUp() {
        super.setUp()
        self.viewModels = ViewModels()
        self.propertyA = MockViewModel()
        self.propertyB = MockSecondViewModel()
    }
    
    func testUpdatesProperty() {
        let expect:XCTestExpectation = self.expectation(description:"Observer not updated")
        let name:String = "hello world"
        self.viewModels.observe { (viewModel:MockViewModel) in
            XCTAssertEqual(viewModel.name, name, "Failed to update")
            expect.fulfill()
        }
        var property:MockViewModel = MockViewModel()
        property.name = name
        self.viewModels.update(viewModel:property)
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testNotifyObserver() {
        var notified:Bool = false
        let expectNotified:XCTestExpectation = self.expectation(description:"Observer not updated")
        let expectAfterCopy:XCTestExpectation = self.expectation(description:"Observer not updated")
        let firstName:String = "hello world"
        let secondName:String = "lorem ipsum"
        self.viewModels.observe { (viewModel:MockViewModel) in
            if notified == false {
                notified = true
                expectNotified.fulfill()
                XCTAssertEqual(firstName, viewModel.name, "Invalid value")
            } else {
                expectAfterCopy.fulfill()
                XCTAssertEqual(secondName, viewModel.name, "Invalid value")
            }
        }
        
        self.propertyA.name = firstName
        self.viewModels.update(viewModel:self.propertyA)
        
        self.propertyA.name = secondName
        self.viewModels.update(viewModel:self.propertyA)
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testReplacesExistingPropertyOfSameType() {
        self.viewModels.update(viewModel:MockViewModel())
        self.viewModels.update(viewModel:MockViewModel())
        self.viewModels.update(viewModel:MockViewModel())
        self.viewModels.update(viewModel:MockViewModel())
        self.viewModels.update(viewModel:MockViewModel())
        self.viewModels.update(viewModel:MockViewModel())
        XCTAssertEqual(self.viewModels.items.count, 1, "Failed to replace")
    }
    
    func testUpdateObserver() {
        let expect:XCTestExpectation = self.expectation(description:"Observer not updated")
        let view:MockView = MockView()
        view.startObserving()
        view.onPropertyUpdated = { expect.fulfill() }
        view.presenter.viewModels.update(viewModel:MockViewModel())
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testNotRetainingObserver() {
        let expect:XCTestExpectation = self.expectation(description:"Observer not updated")
        let container:MockContainer = MockContainer()
        container.view = MockView()
        container.view?.startObserving()
        container.view?.onPropertyUpdated = { expect.fulfill() }
        container.view?.presenter.viewModels.update(viewModel:MockViewModel())
        container.view = nil
        XCTAssertNil(container.view, "Failed to release")
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testUpdatesObserverOnMainThread() {
        let expect:XCTestExpectation = self.expectation(description:"Observer not updated")
        let view:MockView = MockView()
        view.startObserving()
        view.onPropertyUpdated = {
            XCTAssertEqual(Thread.current, Thread.main, "Not on main thread")
            expect.fulfill()
        }
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async {
            view.presenter.viewModels.update(viewModel:MockViewModel())
        }
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
}
