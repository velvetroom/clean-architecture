import Foundation
import CleanArchitecture

class DemoPresenter:Presenter {
    private var amount = Amount()
    private var exchanger = Exchanger()
    
    func updatedRate(string:String) {
        let exchange = updateRateWith(string:string)
        var property = UsdViewModel()
        property.amount = exchange.usd
        update(viewModel:property)
    }
    
    func updatedEuro(string:String) {
        let exchange = updateEuroWith(string:string)
        var property = UsdViewModel()
        property.amount = exchange.usd
        update(viewModel:property)
    }
    
    func updatedUsd(string:String) {
        let exchange = updateUsdWith(string:string)
        var property = EuroViewModel()
        property.amount = exchange.euro
        update(viewModel:property)
    }
    
    override func didAppear() {
        let exchange = initialExchanger()
        var property = DemoViewModel()
        property.rate = exchange.rate
        property.euro = exchange.euro
        property.usd = exchange.usd
        update(viewModel:property)
    }
    
    private func initialExchanger() -> ExchangeText {
        exchanger.euroChanged()
        return amount.exchangeFrom(exchange:exchanger.exchange)
    }
    
    private func updateRateWith(string:String) -> ExchangeText {
        exchanger.exchange.rate = amount.amountFrom(string:string)
        exchanger.rateChanged()
        return amount.exchangeFrom(exchange:exchanger.exchange)
    }
    
    private func updateEuroWith(string:String) -> ExchangeText {
        exchanger.exchange.euro = amount.amountFrom(string:string)
        exchanger.euroChanged()
        return amount.exchangeFrom(exchange:exchanger.exchange)
    }
    
    private func updateUsdWith(string:String) -> ExchangeText {
        exchanger.exchange.usd = amount.amountFrom(string:string)
        exchanger.usdChanged()
        return amount.exchangeFrom(exchange:exchanger.exchange)
    }
}
