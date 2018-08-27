import Foundation
import CleanArchitecture

struct DemoViewModel:ViewModel {
    var rate = String()
    var euro = String()
    var usd = String()
}

struct RateViewModel:ViewModel {
    var amount = String()
}

struct EuroViewModel:ViewModel {
    var amount = String()
}

struct UsdViewModel:ViewModel {
    var amount = String()
}
