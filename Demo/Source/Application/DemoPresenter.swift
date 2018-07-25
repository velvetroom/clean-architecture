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
    
    func didLoad() {
        let exchange:ExchangeText = self.interactor.initialExchanger()
        self.updatedRate(string:exchange.rate)
        self.updatedEuro(string:exchange.euro)
        self.updatedUsd(string:exchange.usd)
    }
}
