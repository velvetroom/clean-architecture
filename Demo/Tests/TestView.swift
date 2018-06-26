import XCTest
@testable import Demo

class TestView:XCTestCase {
    private var view:View!
    
    override func setUp() {
        super.setUp()
        self.view = View()
    }
    
    func testAssignedDelegateToInputs() {
        self.view.didLoad()
        XCTAssertNotNil(self.view.content.inputRate.delegateCallback, "Failed to assign delegate")
        XCTAssertNotNil(self.view.content.inputEuro.delegateCallback, "Failed to assign delegate")
        XCTAssertNotNil(self.view.content.inputUsd.delegateCallback, "Failed to assign delegate")
    }
}
