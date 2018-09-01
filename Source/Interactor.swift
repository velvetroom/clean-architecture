import Foundation

open class Interactor {
    public weak var delegate:Delegate?
    public required init() { }
    open func didLoad() { }
}
