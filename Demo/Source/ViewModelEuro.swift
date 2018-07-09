import Foundation
import CleanArchitecture

struct ViewModelEuro:ViewModelProtocol {
    var observing:((ViewModelEuro) -> Void)?
    var amount:String
    
    init() {
        self.amount = String()
    }
}
