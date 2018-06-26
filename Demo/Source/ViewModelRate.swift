import Foundation
import CleanArchitecture

struct ViewModelRate:ViewModelPropertyProtocol {
    var observing:((ViewModelRate) -> Void)?
    var amount:String
    
    init() {
        self.amount = String()
    }
}
