import Foundation
import CleanArchitecture

struct MockViewModel:ViewModel {
    var name:String
    
    init() {
        self.name = String()
    }
}
