import Foundation
@testable import Demo

class MockAmount:Amount {
    var onAmountFromString:(() -> Void)?
    
    override func amountFrom(string:String) -> Float {
        self.onAmountFromString?()
        return super.amountFrom(string:string)
    }
}
