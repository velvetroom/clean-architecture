import Foundation
import CleanArchitecture

struct ViewModelRate:ViewModelProtocol {
    var amount:String
    
    init() {
        self.amount = String()
    }
}
