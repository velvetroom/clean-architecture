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
        var updated:Bool = false
        let name:String = "hello world"
        self.viewModel.observe { (property:MockViewModelProtocol) in
            XCTAssertEqual(property.name, name, "Failed to update")
            updated = true
        }
        var property:MockViewModelProtocol = MockViewModelProtocol()
        property.name = name
        self.viewModel.update(property:property)
        XCTAssertTrue(updated, "Not updated")
    }
    
    func testNotifyObserver() {
        var notified:Bool = false
        var notifiedAfterCopy:Bool = false
        let firstName:String = "hello world"
        let secondName:String = "lorem ipsum"
        self.viewModel.observe { (viewModel:MockViewModelProtocol) in
            if notified == false {
                notified = true
                XCTAssertEqual(firstName, viewModel.name, "Invalid value")
            } else {
                notifiedAfterCopy = true
                XCTAssertEqual(secondName, viewModel.name, "Invalid value")
            }
        }
        
        self.propertyA.name = firstName
        self.viewModel.update(property:self.propertyA)
        
        self.propertyA.name = secondName
        self.viewModel.update(property:self.propertyA)
        
        XCTAssertTrue(notified, "Not notified")
        XCTAssertTrue(notifiedAfterCopy, "Not notified after copy")
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
        var updated:Bool = false
        let view:MockView = MockView()
        view.startObserving()
        view.onPropertyUpdated = { updated = true }
        view.presenter.viewModel.update(property:MockViewModelProtocol())
        XCTAssertTrue(updated, "Failed to update")
    }
    
    func testNotRetainingObserver() {
        var updated:Bool = false
        let transition:MockTransitionProtocol = MockTransitionProtocol()
        transition.view = MockView()
        transition.view?.startObserving()
        transition.view?.onPropertyUpdated = { updated = true }
        transition.view?.presenter.viewModel.update(property:MockViewModelProtocol())
        transition.view = nil
        XCTAssertTrue(updated, "Failed to update")
        XCTAssertNil(transition.view, "Failed to release")
    }
}
