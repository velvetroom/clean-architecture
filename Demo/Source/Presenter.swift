import Foundation
import CleanArchitecture

class Presenter:PresenterProtocol {
    weak var view:ViewProtocol?
    var viewModel:ViewModel!
    var interactor:Interactor!
    
    required init() { }
    
    func updatedRate(string:String) {
        let exchange:ExchangeText = self.interactor.updateRateWith(string:string)
    }
    
    func updatedEuro(string:String) {
        let exchange:ExchangeText = self.interactor.updateEuroWith(string:string)
        
    }
    
    func updatedUsd(string:String) {
        let exchange:ExchangeText = self.interactor.updateUsdWith(string:string)
        
    }
}
