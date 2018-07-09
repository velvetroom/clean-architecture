import Foundation
import CleanArchitecture

struct ViewModelEuro:ViewModelProtocol {
    var amount:String
    
    init() {
        self.amount = String()
    }
}
