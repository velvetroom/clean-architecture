import Foundation

class Amount {
    private let formatter:NumberFormatter
    
    init() {
        formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.minimumIntegerDigits = 1
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.decimalSeparator = "."
    }
    
    func amountFrom(string:String) -> Float {
        guard let number = formatter.number(from:string) else { return 0 }
        return number.floatValue
    }
    
    func exchangeFrom(exchange:Exchange) -> ExchangeText {
        var text = ExchangeText()
        text.rate = formatter.string(from:NSNumber(value:exchange.rate))!
        text.euro = formatter.string(from:NSNumber(value:exchange.euro))!
        text.usd = formatter.string(from:NSNumber(value:exchange.usd))!
        return text
    }
}
