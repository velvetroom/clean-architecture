import XCTest
@testable import Demo

class TestExchanger:XCTestCase {
    private var exchanger:Exchanger!
    
    override func setUp() {
        super.setUp()
        self.exchanger = Exchanger()
    }
    
    func testRateChanged() {
        self.exchanger.exchange.euro = 5
        self.exchanger.exchange.rate = 2
        self.exchanger.rateChanged()
        let expected:Float = self.exchanger.exchange.rate * self.exchanger.exchange.euro
        XCTAssertEqual(self.exchanger.exchange.usd, expected, "Invalid amount")
    }
    
    func testEuroChanged() {
        self.exchanger.exchange.rate = 3
        self.exchanger.exchange.euro = 8
        self.exchanger.euroChanged()
        let expected:Float = self.exchanger.exchange.euro * self.exchanger.exchange.rate
        XCTAssertEqual(self.exchanger.exchange.usd, expected, "Invalid amount")
    }
    
    func testUsdChanged() {
        self.exchanger.exchange.rate = 8
        self.exchanger.exchange.usd = 12
        self.exchanger.usdChanged()
        let expected:Float = self.exchanger.exchange.usd / self.exchanger.exchange.rate
        XCTAssertEqual(self.exchanger.exchange.euro, expected, "Invalid amount")
    }
    
    func testUsdChangedWithRateZero() {
        self.exchanger.exchange.rate = 0
        self.exchanger.exchange.usd = 12
        self.exchanger.usdChanged()
        XCTAssertEqual(self.exchanger.exchange.euro, 0, "Invalid amount")
    }
}
