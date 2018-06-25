import XCTest
@testable import CleanArchitecture

class TestViewModel:XCTestCase {
    private var viewModel:ViewModel!
    private var propertyA:MockViewModelPropertyProtocol!
    private var propertyB:MockViewModelSecondPropertyProtocol!
    
    override func setUp() {
        super.setUp()
        self.viewModel = ViewModel()
        self.propertyA = MockViewModelPropertyProtocol()
        self.propertyB = MockViewModelSecondPropertyProtocol()
    }
    
    func testUpdatesProperty() {
        var property:MockViewModelPropertyProtocol = self.viewModel.property()
        property.name = "hello world"
        self.viewModel.update(property:property)
        let updatedProperty:MockViewModelPropertyProtocol = self.viewModel.property()
        XCTAssertEqual(updatedProperty.name, property.name, "Failed to update")
    }
    
    func testNotifyObserver() {
        var notified:Bool = false
        var notifiedAfterCopy:Bool = false
        let firstName:String = "hello world"
        let secondName:String = "lorem ipsum"
        self.propertyA.observing = { (viewModel:MockViewModelPropertyProtocol) in
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
    
    func testPropertyCreatesViewModelIfNotFound() {
        let property:MockViewModelPropertyProtocol? = self.viewModel.property()
        XCTAssertNotNil(property, "Failed to create property")
    }
    
    func testReturnsRightProperty() {
        self.viewModel.update(property:self.propertyA)
        self.viewModel.update(property:self.propertyB)
        let property:MockViewModelPropertyProtocol? = self.viewModel.property()
        XCTAssertNotNil(property, "Property is not the right type")
    }
    
    func testReplacesExistingPropertyOfSameType() {
        self.viewModel.update(property:MockViewModelPropertyProtocol())
        self.viewModel.update(property:MockViewModelPropertyProtocol())
        self.viewModel.update(property:MockViewModelPropertyProtocol())
        self.viewModel.update(property:MockViewModelPropertyProtocol())
        self.viewModel.update(property:MockViewModelPropertyProtocol())
        self.viewModel.update(property:MockViewModelPropertyProtocol())
        XCTAssertEqual(self.viewModel.properties.count, 1, "Failed to replace")
    }
    
    func testCopyObserverWhenReplacingProperty() {
        var secondPropertyCalled:Bool = false
        var fourthPropertyCalled:Bool = false
        let firstProperty:MockViewModelPropertyProtocol = MockViewModelPropertyProtocol()
        self.viewModel.update(property:firstProperty)
        let returnAfterFirstProperty:MockViewModelPropertyProtocol = self.viewModel.property()
        XCTAssertNil(returnAfterFirstProperty.observing, "Should not contain observer")
        
        var secondProperty:MockViewModelPropertyProtocol = MockViewModelPropertyProtocol()
        secondProperty.observing = { (viewModel:MockViewModelPropertyProtocol) in
            secondPropertyCalled = true
        }
        self.viewModel.update(property:secondProperty)
        let returnAfterSecondProperty:MockViewModelPropertyProtocol = self.viewModel.property()
        XCTAssertNotNil(returnAfterSecondProperty.observing, "Should contain observer")
        
        let thirdProperty:MockViewModelPropertyProtocol = MockViewModelPropertyProtocol()
        self.viewModel.update(property:thirdProperty)
        let returnAfterThirdProperty:MockViewModelPropertyProtocol = self.viewModel.property()
        XCTAssertNotNil(returnAfterThirdProperty, "Should have copied observer")
        
        var fourthProperty:MockViewModelPropertyProtocol = MockViewModelPropertyProtocol()
        fourthProperty.observing = { (viewModel:MockViewModelPropertyProtocol) in
            fourthPropertyCalled = true
        }
        self.viewModel.update(property:fourthProperty)
        let returnAfterFourthProperty:MockViewModelPropertyProtocol = self.viewModel.property()
        XCTAssertNotNil(returnAfterFourthProperty, "Should have kept observer")
        
        secondPropertyCalled = false
        fourthPropertyCalled = false
        self.viewModel.update(property:MockViewModelPropertyProtocol())
        
        XCTAssertFalse(secondPropertyCalled, "Second should not be called")
        XCTAssertTrue(fourthPropertyCalled, "Fourth should not be called")
    }
}
