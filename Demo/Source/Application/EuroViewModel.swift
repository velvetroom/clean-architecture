import Foundation
import CleanArchitecture

struct EuroViewModel:ViewModelProtocol {
    var amount:String
    
    init() {
        self.amount = String()
    }
}
