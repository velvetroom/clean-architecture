import XCTest
@testable import Demo

class TestAmount:XCTestCase {
    private var amount:Amount!
    
    override func setUp() {
        super.setUp()
        self.amount = Amount()
    }
    
    func testValidateEmpty() {
        let amount:Float = self.amount.amountFrom(string:String())
        XCTAssertEqual(amount, 0, "Invalid amount")
    }
    
    func testValidateSuccess() {
        let test:Float = 14.5
        let amount:Float = self.amount.amountFrom(string:String(test))
        XCTAssertEqual(amount, test, "Invalid amount")
    }
    
    func testValidateInvalidInput() {
        let amount:Float = self.amount.amountFrom(string:"lorem ipsum")
        XCTAssertEqual(amount, 0, "Invalid amount")
    }
    
    func testValidateNegative() {
        let test:Float = -5
        let amount:Float = self.amount.amountFrom(string:String(test))
        XCTAssertEqual(amount, test, "Invalid amount")
    }
}
