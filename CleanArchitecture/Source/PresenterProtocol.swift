import Foundation

public protocol PresenterProtocol:InteractorDelegateProtocol {
    associatedtype Interactor:InteractorProtocol
    var interactor:Interactor! { get set }
    var viewModel:ViewModel! { get set }
    
    init()
    func didLoad()
    func willAppear()
    func didAppear()
    func orientationChanged()
}
