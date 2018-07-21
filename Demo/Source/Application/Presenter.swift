import Foundation
import CleanArchitecture

class Presenter:PresenterProtocol {
    var viewModel:ViewModel!
    var interactor:Interactor!
    
    required init() { }
    
    func updatedRate(string:String) {
        let exchange:ExchangeText = self.interactor.updateRateWith(string:string)
        var property:UsdViewModel = UsdViewModel()
        property.amount = exchange.usd
        self.viewModel.update(property:property)
    }
    
    func updatedEuro(string:String) {
        let exchange:ExchangeText = self.interactor.updateEuroWith(string:string)
        var property:UsdViewModel = UsdViewModel()
        property.amount = exchange.usd
        self.viewModel.update(property:property)
    }
    
    func updatedUsd(string:String) {
        let exchange:ExchangeText = self.interactor.updateUsdWith(string:string)
        var property:EuroViewModel = EuroViewModel()
        property.amount = exchange.euro
        self.viewModel.update(property:property)
    }
    
    func didLoad() {
        self.initialValues()
    }
    
    private func initialValues() {
        self.initialExchanger()
        self.initialRate()
        self.initialEuro()
        self.initialUsd()
    }
    
    private func initialExchanger() {
        self.interactor.exchanger.exchange.rate = Constants.initialRate
        self.interactor.exchanger.exchange.euro = Constants.initialEuro
    }
    
    private func initialRate() {
        let exchange:ExchangeText = self.interactor.initialExchanger()
        var property:RateViewModel = RateViewModel()
        property.amount = exchange.rate
        self.viewModel.update(property:property)
    }
    
    private func initialEuro() {
        let exchange:ExchangeText = self.interactor.initialExchanger()
        var property:EuroViewModel = EuroViewModel()
        property.amount = exchange.euro
        self.viewModel.update(property:property)
    }
    
    private func initialUsd() {
        let exchange:ExchangeText = self.interactor.initialExchanger()
        var property:UsdViewModel = UsdViewModel()
        property.amount = exchange.usd
        self.viewModel.update(property:property)
    }
}

private struct Constants {
    static let initialRate:Float = 1.17
    static let initialEuro:Float = 1
}

