import Foundation
import CleanArchitecture

class Presenter:PresenterProtocol {
    weak var view:ViewProtocol?
    var viewModel:ViewModel!
    var interactor:Interactor!
    
    required init() { }
    
    func updatedRate(string:String) {
        let amount:Float = self.interactor.amountFrom(string:string)
    }
    
    func updatedEuro(string:String) {
        let amount:Float = self.interactor.amountFrom(string:string)
    }
    
    func updatedUsd(string:String) {
        let amount:Float = self.interactor.amountFrom(string:string)
    }
}
