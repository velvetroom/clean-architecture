import Foundation

struct Exchange {
    var rate:Float
    var euro:Float
    var usd:Float
    
    init() {
        self.rate = Constants.rate
        self.euro = Constants.euro
        self.usd = 0
    }
}

private struct Constants {
    static let rate:Float = 1.17
    static let euro:Float = 1
}
