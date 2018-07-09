import UIKit
import CleanArchitecture

struct MockViewModelSecondProtocol:ViewModelProtocol {
    var value:CGFloat
    
    init() {
        self.value = 0
    }
}
