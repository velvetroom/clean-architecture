import Foundation
import CleanArchitecture

struct ViewModelUsd:ViewModelPropertyProtocol {
    var observing:((ViewModelUsd) -> Void)?
    var amount:String
    
    init() {
        self.amount = String()
    }
}
