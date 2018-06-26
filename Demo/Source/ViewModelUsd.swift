import Foundation
import CleanArchitecture

struct ViewModelUsd:ViewModelPropertyProtocol {
    var observing:((ViewModelUsd) -> Void)?
    var amount:Float
    
    init() {
        self.amount = 0
    }
}
