import Foundation
@testable import Demo

class MockAmount:Amount {
    var onAmountFromString:(() -> Void)?
    var onExchangeFrom:(() -> Void)?
    
    override func amountFrom(string:String) -> Float {
        self.onAmountFromString?()
        return super.amountFrom(string:string)
    }
    
    override func exchangeFrom(exchange:Exchange) -> ExchangeText {
        self.onExchangeFrom?()
        return ExchangeText()
    }
}
