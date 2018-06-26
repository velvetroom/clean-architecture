import Foundation

class Amount {
    private let formatter:NumberFormatter
    
    init() {
        self.formatter = NumberFormatter()
        self.formatter.numberStyle = NumberFormatter.Style.decimal
        self.formatter.minimumIntegerDigits = Constants.minIntegers
        self.formatter.minimumFractionDigits = Constants.minDecimals
        self.formatter.maximumFractionDigits = Constants.maxDecimals
    }
    
    func amountFrom(string:String) -> Float {
        guard
            let number:NSNumber = self.formatter.number(from:string)
        else { return Constants.defaultAmount }
        return number.floatValue
    }
}
