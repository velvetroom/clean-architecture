import Foundation
@testable import Demo

class MockInteractor:DemoInteractor {
    var onUpdateRate:(() -> Void)?
    var onUpdateEuro:(() -> Void)?
    var onUpdateUsd:(() -> Void)?
    
    override func updateRateWith(string:String) -> ExchangeText {
        self.onUpdateRate?()
        return ExchangeText()
    }
    
    override func updateEuroWith(string:String) -> ExchangeText {
        self.onUpdateEuro?()
        return ExchangeText()
    }
    
    override func updateUsdWith(string:String) -> ExchangeText {
        self.onUpdateUsd?()
        return ExchangeText()
    }
}
