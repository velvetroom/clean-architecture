import Foundation
@testable import Demo

class MockExchanger:Exchanger {
    var onRateChanged:(() -> Void)?
    var onEuroChanged:(() -> Void)?
    var onUsdChanged:(() -> Void)?
    
    override func rateChanged() {
        self.onRateChanged?()
    }
    
    override func euroChanged() {
        self.onEuroChanged?()
    }
    
    override func usdChanged() {
        self.onUsdChanged?()
    }
}
