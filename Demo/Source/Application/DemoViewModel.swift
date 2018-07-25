import Foundation
import CleanArchitecture

struct RateViewModel:ViewModel {
    var amount:String
    
    init() {
        self.amount = String()
    }
}

struct EuroViewModel:ViewModel {
    var amount:String
    
    init() {
        self.amount = String()
    }
}

struct UsdViewModel:ViewModel {
    var amount:String
    
    init() {
        self.amount = String()
    }
}
