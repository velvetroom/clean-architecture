import Foundation
import CleanArchitecture

struct ViewModelRate:ViewModelProtocol {
    var observing:((ViewModelRate) -> Void)?
    var amount:String
    
    init() {
        self.amount = String()
    }
}
