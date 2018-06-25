import UIKit
import CleanArchitecture

struct MockViewModelSecondPropertyProtocol:ViewModelPropertyProtocol {
    var observing:((MockViewModelSecondPropertyProtocol) -> Void)?
    var value:CGFloat
    
    init() {
        self.value = 0
    }
}
