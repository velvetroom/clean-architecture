import Foundation
import CleanArchitecture

struct RateViewModel:ViewModelProtocol {
    var amount:String
    
    init() {
        self.amount = String()
    }
}
