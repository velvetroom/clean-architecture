import Foundation
import CleanArchitecture

struct ViewModelEuro:ViewModelPropertyProtocol {
    var observing:((ViewModelEuro) -> Void)?
    var amount:Float
    
    init() {
        self.amount = 0
    }
}
