import Foundation

class Amount {
    private let formatter:NumberFormatter
    
    init() {
        self.formatter = NumberFormatter()
        self.formatter.numberStyle = NumberFormatter.Style.decimal
        self.formatter.minimumIntegerDigits = Constants.minIntegers
        self.formatter.minimumFractionDigits = Constants.minDecimals
        self.formatter.maximumFractionDigits = Constants.maxDecimals
        self.formatter.decimalSeparator = "."
    }
    
    func amountFrom(string:String) -> Float {
        guard
            let number:NSNumber = self.formatter.number(from:string)
        else { return Constants.defaultAmount }
        return number.floatValue
    }
    
    func exchangeFrom(exchange:Exchange) -> ExchangeText {
        var text:ExchangeText = ExchangeText()
        text.rate = self.formatter.string(from:NSNumber(value:exchange.rate))!
        text.euro = self.formatter.string(from:NSNumber(value:exchange.euro))!
        text.usd = self.formatter.string(from:NSNumber(value:exchange.usd))!
        return text
    }
}

private struct Constants {
    static let defaultAmount:Float = 0
    static let minIntegers:Int = 1
    static let minDecimals:Int = 2
    static let maxDecimals:Int = 2
}
