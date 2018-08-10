import Foundation
import CleanArchitecture

class DemoPresenter:Presenter {
    var viewModels:ViewModels!
    var interactor:DemoInteractor!
    
    required init() { }
    
    func updatedRate(string:String) {
        let exchange:ExchangeText = self.interactor.updateRateWith(string:string)
        var property:UsdViewModel = UsdViewModel()
        property.amount = exchange.usd
        self.viewModels.update(viewModel:property)
    }
    
    func updatedEuro(string:String) {
        let exchange:ExchangeText = self.interactor.updateEuroWith(string:string)
        var property:UsdViewModel = UsdViewModel()
        property.amount = exchange.usd
        self.viewModels.update(viewModel:property)
    }
    
    func updatedUsd(string:String) {
        let exchange:ExchangeText = self.interactor.updateUsdWith(string:string)
        var property:EuroViewModel = EuroViewModel()
        property.amount = exchange.euro
        self.viewModels.update(viewModel:property)
    }
    
    func didAppear() {
        let exchange:ExchangeText = self.interactor.initialExchanger()
        var property:DemoViewModel = DemoViewModel()
        property.rate = exchange.rate
        property.euro = exchange.euro
        property.usd = exchange.usd
        self.viewModels.update(viewModel:property)
    }
}
