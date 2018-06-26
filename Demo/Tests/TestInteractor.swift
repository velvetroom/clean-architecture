import XCTest
@testable import Demo

class TestInteractor:XCTestCase {
    private var view:View!
    private var interactor:Interactor!
    
    override func setUp() {
        super.setUp()
        self.view = View()
        self.interactor = self.view.presenter.interactor
    }
    
    func testValidateAmount() {
        var validated:Bool = false
        let amount:MockAmount = MockAmount()
        self.interactor.amount = amount
        amount.onAmountFromString = { validated = true }
        let _:Float = self.interactor.amountFrom(string:String())
        XCTAssertTrue(validated, "Not validated")
    }
}
