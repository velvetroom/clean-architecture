import Foundation
import CleanArchitecture

struct ViewModelRate:ViewModelPropertyProtocol {
    var observing:((ViewModelRate) -> Void)?
    var amount:Float
    
    init() {
        self.amount = 0
    }
}
