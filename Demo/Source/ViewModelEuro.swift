import Foundation
import CleanArchitecture

struct ViewModelEuro:ViewModelPropertyProtocol {
    var observing:((ViewModelEuro) -> Void)?
    var amount:String
    
    init() {
        self.amount = String()
    }
}
