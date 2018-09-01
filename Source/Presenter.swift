import Foundation

open class Presenter<I:Interactor>:Delegate {
    open var interactor:I!
    open var viewModels:ViewModels!
    
    public required init() {
        
    }
    
    open func didLoad() {}
    open func willAppear() { }
    open func didAppear() { }
    open func shouldUpdate() { }
}

public protocol Delegate:AnyObject {
    func shouldUpdate()
}
