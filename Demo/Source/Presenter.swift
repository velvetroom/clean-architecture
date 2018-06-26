import Foundation
import CleanArchitecture

class Presenter:PresenterProtocol {
    weak var view:ViewProtocol?
    var viewModel:ViewModel!
    var interactor:Interactor!
    
    required init() { }
    
    func updatedRate(string:String) {
        
    }
    
    func updatedEuro(string:String) {
        
    }
    
    func updatedUsd(string:String) {
        
    }
}
