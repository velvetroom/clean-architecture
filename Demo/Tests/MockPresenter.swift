import Foundation
@testable import Demo

class MockPresenter:Presenter {
    var onUpdatedRate:(() -> Void)?
    var onUpdatedEuro:(() -> Void)?
    var onUpdatedUsd:(() -> Void)?
    
    override func updatedRate(string:String) {
        self.onUpdatedRate?()
    }
    
    override func updatedEuro(string:String) {
        self.onUpdatedEuro?()
    }
    
    override func updatedUsd(string:String) {
        self.onUpdatedUsd?()
    }
}
