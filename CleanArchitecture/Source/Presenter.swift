import Foundation

public protocol Presenter:InteractorDelegate {
    associatedtype Interactor:InteractorProtocol
    var interactor:Interactor! { get set }
    var viewModel:ViewModel! { get set }
    
    init()
    func didLoad()
    func willAppear()
    func didAppear()
}

public extension Presenter {
    func didLoad() { }
    func willAppear() { }
    func didAppear() { }
    func shouldUpdate() { }
}

public protocol InteractorDelegate:AnyObject {
    func shouldUpdate()
}
