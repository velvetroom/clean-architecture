import Foundation
import CleanArchitecture

struct UsdViewModel:ViewModelProtocol {
    var amount:String
    
    init() {
        self.amount = String()
    }
}
