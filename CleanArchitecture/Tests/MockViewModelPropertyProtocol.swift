import Foundation
import CleanArchitecture

struct MockViewModelPropertyProtocol:ViewModelProtocol {
    var observing:((MockViewModelPropertyProtocol) -> Void)?
    var name:String
    
    init() {
        self.name = String()
    }
}
