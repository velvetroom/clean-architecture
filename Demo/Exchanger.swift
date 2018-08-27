import Foundation

class Exchanger {
    var exchange = Exchange()
    
    func rateChanged() {
        exchange.usd = exchange.rate * exchange.euro
    }
    
    func euroChanged() {
        exchange.usd = exchange.rate * exchange.euro
    }
    
    func usdChanged() {
        if exchange.rate == 0 {
            exchange.euro = 0
        } else {
            exchange.euro = exchange.usd / exchange.rate
        }
    }
}
