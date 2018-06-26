import Foundation
@testable import Demo

class MockInteractor:Interactor {
    var onAmountFrom:(() -> Void)?
    
    override func amountFrom(string:String) -> Float {
        self.onAmountFrom?()
        return super.amountFrom(string:string)
    }
}
