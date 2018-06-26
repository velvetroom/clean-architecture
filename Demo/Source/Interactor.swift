import Foundation
import CleanArchitecture

class Interactor:InteractorProtocol {
    var presenter:InteractorDelegateProtocol?
    var amount:Amount
    var exchanger:Exchanger
    
    required init() {
        self.amount = Amount()
        self.exchanger = Exchanger()
    }
    
    func initialExchanger() -> ExchangeText {
        self.exchanger.euroChanged()
        return self.amount.exchangeFrom(exchange:self.exchanger.exchange)
    }
    
    func updateRateWith(string:String) -> ExchangeText {
        self.exchanger.exchange.rate = self.amount.amountFrom(string:string)
        self.exchanger.rateChanged()
        return self.amount.exchangeFrom(exchange:self.exchanger.exchange)
    }
    
    func updateEuroWith(string:String) -> ExchangeText {
        self.exchanger.exchange.euro = self.amount.amountFrom(string:string)
        self.exchanger.euroChanged()
        return self.amount.exchangeFrom(exchange:self.exchanger.exchange)
    }
    
    func updateUsdWith(string:String) -> ExchangeText {
        self.exchanger.exchange.usd = self.amount.amountFrom(string:string)
        self.exchanger.usdChanged()
        return self.amount.exchangeFrom(exchange:self.exchanger.exchange)
    }
}
