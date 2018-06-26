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
    
    func testValidateRateAmount() {
        var validated:Bool = false
        let amount:MockAmount = MockAmount()
        self.interactor.amount = amount
        amount.onAmountFromString = { validated = true }
        let _:ExchangeText = self.interactor.updateRateWith(string:String())
        XCTAssertTrue(validated, "Not validated")
    }
    
    func testExchangeRateAmount() {
        var exchanged:Bool = false
        let amount:MockAmount = MockAmount()
        self.interactor.amount = amount
        amount.onExchangeFrom = { exchanged = true }
        let _:ExchangeText = self.interactor.updateRateWith(string:String())
        XCTAssertTrue(exchanged, "Not exchanged")
    }
    
    func testExchangerUpdateWithRate() {
        var updated:Bool = false
        let exchanger:MockExchanger = MockExchanger()
        self.interactor.exchanger = exchanger
        exchanger.onRateChanged = { updated = true }
        let _:ExchangeText = self.interactor.updateRateWith(string:String())
        XCTAssertTrue(updated, "Not updated")
    }
    
    func testValidateEuroAmount() {
        var validated:Bool = false
        let amount:MockAmount = MockAmount()
        self.interactor.amount = amount
        amount.onAmountFromString = { validated = true }
        let _:ExchangeText = self.interactor.updateEuroWith(string:String())
        XCTAssertTrue(validated, "Not validated")
    }
    
    func testExchangeEuroAmount() {
        var exchanged:Bool = false
        let amount:MockAmount = MockAmount()
        self.interactor.amount = amount
        amount.onExchangeFrom = { exchanged = true }
        let _:ExchangeText = self.interactor.updateEuroWith(string:String())
        XCTAssertTrue(exchanged, "Not exchanged")
    }
    
    func testExchangerUpdateWithEuro() {
        var updated:Bool = false
        let exchanger:MockExchanger = MockExchanger()
        self.interactor.exchanger = exchanger
        exchanger.onEuroChanged = { updated = true }
        let _:ExchangeText = self.interactor.updateEuroWith(string:String())
        XCTAssertTrue(updated, "Not updated")
    }
    
    func testValidateUsdAmount() {
        var validated:Bool = false
        let amount:MockAmount = MockAmount()
        self.interactor.amount = amount
        amount.onAmountFromString = { validated = true }
        let _:ExchangeText = self.interactor.updateUsdWith(string:String())
        XCTAssertTrue(validated, "Not validated")
    }
    
    func testExchangeUsdAmount() {
        var exchanged:Bool = false
        let amount:MockAmount = MockAmount()
        self.interactor.amount = amount
        amount.onExchangeFrom = { exchanged = true }
        let _:ExchangeText = self.interactor.updateUsdWith(string:String())
        XCTAssertTrue(exchanged, "Not exchanged")
    }
    
    func testExchangerUpdateWithUsd() {
        var updated:Bool = false
        let exchanger:MockExchanger = MockExchanger()
        self.interactor.exchanger = exchanger
        exchanger.onUsdChanged = { updated = true }
        let _:ExchangeText = self.interactor.updateUsdWith(string:String())
        XCTAssertTrue(updated, "Not updated")
    }
}
