import Foundation
import CleanArchitecture

struct ViewModelUsd:ViewModelProtocol {
    var amount:String
    
    init() {
        self.amount = String()
    }
}
