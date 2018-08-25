import Foundation

struct Exchange {
    var rate:Float
    var euro:Float
    var usd:Float
    private static let rate:Float = 1.17
    private static let euro:Float = 1
    
    init() {
        rate = Exchange.rate
        euro = Exchange.euro
        usd = 0
    }
}
