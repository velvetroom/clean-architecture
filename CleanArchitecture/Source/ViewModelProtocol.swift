import Foundation

public protocol ViewModelProtocol {
    var observing:((Self) -> Void)? { get set }
    
    init()
}
