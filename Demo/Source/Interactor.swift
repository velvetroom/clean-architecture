import Foundation
import CleanArchitecture

class Interactor:InteractorProtocol {
    var presenter:InteractorDelegateProtocol?
    var amount:Amount
    var exchanger:Exchanger
    
    required init() {
        self.amount = Amount()
        self.exchanger = Exchanger()
    }
    
    func amountFrom(string:String) -> Float {
        return self.amount.amountFrom(string:string)
    }
}
