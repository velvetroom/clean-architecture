import Foundation

public protocol Interactor:AnyObject {
    var presenter:InteractorDelegate? { get set }
    
    init()
    func didLoad()
}

public extension Interactor {
    func didLoad() { }
}
