import UIKit
import CleanArchitecture

class DemoInteractor:Interactor {
    weak var delegate:InteractorDelegate?
    var amount:Amount = Amount()
    var exchanger = Exchanger()
    
    required init() { }
    
    func initialExchanger() -> ExchangeText {
        exchanger.euroChanged()
        return amount.exchangeFrom(exchange:exchanger.exchange)
    }
    
    func updateRateWith(string:String) -> ExchangeText {
        exchanger.exchange.rate = amount.amountFrom(string:string)
        exchanger.rateChanged()
        return amount.exchangeFrom(exchange:exchanger.exchange)
    }
    
    func updateEuroWith(string:String) -> ExchangeText {
        exchanger.exchange.euro = amount.amountFrom(string:string)
        exchanger.euroChanged()
        return amount.exchangeFrom(exchange:exchanger.exchange)
    }
    
    func updateUsdWith(string:String) -> ExchangeText {
        exchanger.exchange.usd = amount.amountFrom(string:string)
        exchanger.usdChanged()
        return amount.exchangeFrom(exchange:exchanger.exchange)
    }
}
