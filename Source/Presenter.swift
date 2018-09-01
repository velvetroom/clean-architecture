import Foundation

public protocol Presenter:Delegate {
    associatedtype I:Interactor
    var interactor:I! { get set }
    var viewModels:ViewModels! { get set }
    
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

public protocol Delegate:AnyObject {
    func shouldUpdate()
}
