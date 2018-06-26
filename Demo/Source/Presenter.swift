import Foundation
import CleanArchitecture

class Presenter:PresenterProtocol {
    weak var view:ViewProtocol?
    var viewModel:ViewModel!
    var interactor:Interactor!
    
    required init() { }
}
