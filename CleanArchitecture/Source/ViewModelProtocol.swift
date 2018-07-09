import Foundation

public protocol ViewModelProtocol {
    var observing:((Self) -> Void)? { get set }
    
    init()
}

public extension ViewModelProtocol {
    func notifyObserver() {
        self.observing?(self)
    }
}
