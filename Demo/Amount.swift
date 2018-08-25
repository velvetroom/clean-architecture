import Foundation

class Amount {
    private let formatter:NumberFormatter
    private static let defaultAmount:Float = 0
    private static let minIntegers:Int = 1
    private static let minDecimals:Int = 2
    private static let maxDecimals:Int = 2
    
    init() {
        formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.minimumIntegerDigits = Amount.minIntegers
        formatter.minimumFractionDigits = Amount.minDecimals
        formatter.maximumFractionDigits = Amount.maxDecimals
        formatter.decimalSeparator = "."
    }
    
    func amountFrom(string:String) -> Float {
        guard let number = formatter.number(from:string) else { return Amount.defaultAmount }
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
