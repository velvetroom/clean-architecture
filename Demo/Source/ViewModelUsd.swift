import Foundation
import CleanArchitecture

struct ViewModelUsd:ViewModelProtocol {
    var observing:((ViewModelUsd) -> Void)?
    var amount:String
    
    init() {
        self.amount = String()
    }
}
