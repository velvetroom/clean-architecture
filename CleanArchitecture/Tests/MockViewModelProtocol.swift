import Foundation
import CleanArchitecture

struct MockViewModelProtocol:ViewModelProtocol {
    var name:String
    
    init() {
        self.name = String()
    }
}
