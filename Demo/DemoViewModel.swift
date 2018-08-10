import Foundation
import CleanArchitecture

struct DemoViewModel:ViewModel {
    var rate:String
    var euro:String
    var usd:String
    
    init() {
        self.rate = String()
        self.euro = String()
        self.usd = String()
    }
}

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
