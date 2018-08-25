import Foundation
import CleanArchitecture

class DemoPresenter:Presenter {
    var viewModels:ViewModels!
    var interactor:DemoInteractor!
    
    required init() { }
    
    func updatedRate(string:String) {
        let exchange = interactor.updateRateWith(string:string)
        var property = UsdViewModel()
        property.amount = exchange.usd
        viewModels.update(viewModel:property)
    }
    
    func updatedEuro(string:String) {
        let exchange = interactor.updateEuroWith(string:string)
        var property = UsdViewModel()
        property.amount = exchange.usd
        viewModels.update(viewModel:property)
    }
    
    func updatedUsd(string:String) {
        let exchange = interactor.updateUsdWith(string:string)
        var property = EuroViewModel()
        property.amount = exchange.euro
        viewModels.update(viewModel:property)
    }
    
    func didAppear() {
        let exchange = interactor.initialExchanger()
        var property = DemoViewModel()
        property.rate = exchange.rate
        property.euro = exchange.euro
        property.usd = exchange.usd
        viewModels.update(viewModel:property)
    }
}
