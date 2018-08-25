import Foundation
import CleanArchitecture

struct DemoViewModel:ViewModel {
    var rate:String
    var euro:String
    var usd:String
    
    init() {
        rate = String()
        euro = String()
        usd = String()
    }
}

struct RateViewModel:ViewModel {
    var amount:String
    
    init() {
        amount = String()
    }
}

struct EuroViewModel:ViewModel {
    var amount:String
    
    init() {
        amount = String()
    }
}

struct UsdViewModel:ViewModel {
    var amount:String
    
    init() {
        amount = String()
    }
}
