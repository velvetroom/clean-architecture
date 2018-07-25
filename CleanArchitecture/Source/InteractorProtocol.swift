import Foundation

public protocol InteractorProtocol:AnyObject {
    var presenter:InteractorDelegate? { get set }
    
    init()
    func didLoad()
}

public extension InteractorProtocol {
    func didLoad() { }
}
