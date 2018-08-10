import Foundation

class Exchanger {
    var exchange:Exchange
    
    init() {
        self.exchange = Exchange()
    }
    
    func rateChanged() {
        self.exchange.usd = self.exchange.rate * self.exchange.euro
    }
    
    func euroChanged() {
        self.exchange.usd = self.exchange.rate * self.exchange.euro
    }
    
    func usdChanged() {
        if self.exchange.rate == 0 {
            self.exchange.euro = 0
        } else {
            self.exchange.euro = self.exchange.usd / self.exchange.rate
        }
    }
}
