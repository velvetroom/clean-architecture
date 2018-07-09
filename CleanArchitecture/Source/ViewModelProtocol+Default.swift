import Foundation

public extension ViewModelProtocol {
    func notifyObserver() {
        self.observing?(self)
    }
}
