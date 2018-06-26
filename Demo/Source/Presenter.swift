import Foundation
import CleanArchitecture

class Presenter:PresenterProtocol {
    weak var view:ViewProtocol?
    var viewModel:ViewModel!
    var interactor:Interactor!
    
    required init() { }
    
    func updatedRate(string:String) {
        let exchange:ExchangeText = self.interactor.updateRateWith(string:string)
        var property:ViewModelUsd = self.viewModel.property()
        property.amount = exchange.usd
        self.viewModel.update(property:property)
    }
    
    func updatedEuro(string:String) {
        let exchange:ExchangeText = self.interactor.updateEuroWith(string:string)
        var property:ViewModelUsd = self.viewModel.property()
        property.amount = exchange.usd
        self.viewModel.update(property:property)
    }
    
    func updatedUsd(string:String) {
        let exchange:ExchangeText = self.interactor.updateUsdWith(string:string)
        var property:ViewModelEuro = self.viewModel.property()
        property.amount = exchange.rate
        self.viewModel.update(property:property)
    }
}
