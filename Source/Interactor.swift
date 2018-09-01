import Foundation

public protocol Interactor:AnyObject {
    var delegate:Delegate? { get set }
    
    init()
    func didLoad()
}

public extension Interactor {
    func didLoad() { }
}
