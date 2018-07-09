import UIKit
import CleanArchitecture

struct MockViewModelSecondPropertyProtocol:ViewModelProtocol {
    var observing:((MockViewModelSecondPropertyProtocol) -> Void)?
    var value:CGFloat
    
    init() {
        self.value = 0
    }
}
