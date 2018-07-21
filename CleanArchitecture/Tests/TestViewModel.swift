import XCTest
@testable import CleanArchitecture

class TestViewModel:XCTestCase {
    private var viewModel:ViewModel!
    private var propertyA:MockViewModelProtocol!
    private var propertyB:MockViewModelSecondProtocol!
    
    override func setUp() {
        super.setUp()
        self.viewModel = ViewModel()
        self.propertyA = MockViewModelProtocol()
        self.propertyB = MockViewModelSecondProtocol()
    }
    
    func testUpdatesProperty() {
        let expect:XCTestExpectation = self.expectation(description:"Observer not updated")
        let name:String = "hello world"
        self.viewModel.observe { (property:MockViewModelProtocol) in
            XCTAssertEqual(property.name, name, "Failed to update")
            expect.fulfill()
        }
        var property:MockViewModelProtocol = MockViewModelProtocol()
        property.name = name
        self.viewModel.update(property:property)
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testNotifyObserver() {
        var notified:Bool = false
        let expectNotified:XCTestExpectation = self.expectation(description:"Observer not updated")
        let expectAfterCopy:XCTestExpectation = self.expectation(description:"Observer not updated")
        let firstName:String = "hello world"
        let secondName:String = "lorem ipsum"
        self.viewModel.observe { (viewModel:MockViewModelProtocol) in
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
        self.viewModel.update(property:self.propertyA)
        
        self.propertyA.name = secondName
        self.viewModel.update(property:self.propertyA)
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testReplacesExistingPropertyOfSameType() {
        self.viewModel.update(property:MockViewModelProtocol())
        self.viewModel.update(property:MockViewModelProtocol())
        self.viewModel.update(property:MockViewModelProtocol())
        self.viewModel.update(property:MockViewModelProtocol())
        self.viewModel.update(property:MockViewModelProtocol())
        self.viewModel.update(property:MockViewModelProtocol())
        XCTAssertEqual(self.viewModel.items.count, 1, "Failed to replace")
    }
    
    func testUpdateObserver() {
        let expect:XCTestExpectation = self.expectation(description:"Observer not updated")
        let view:MockView = MockView()
        view.startObserving()
        view.onPropertyUpdated = { expect.fulfill() }
        view.presenter.viewModel.update(property:MockViewModelProtocol())
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testNotRetainingObserver() {
        let expect:XCTestExpectation = self.expectation(description:"Observer not updated")
        let transition:MockTransitionProtocol = MockTransitionProtocol()
        transition.view = MockView()
        transition.view?.startObserving()
        transition.view?.onPropertyUpdated = { expect.fulfill() }
        transition.view?.presenter.viewModel.update(property:MockViewModelProtocol())
        transition.view = nil
        XCTAssertNil(transition.view, "Failed to release")
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
            view.presenter.viewModel.update(property:MockViewModelProtocol())
        }
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
}
