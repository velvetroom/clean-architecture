import XCTest
@testable import Demo

class TestViewInput:XCTestCase {
    private var view:InputView!
    
    override func setUp() {
        super.setUp()
        self.view = InputView()
    }
    
    func testCallsDelegateCallbackOnTextChange() {
        var called:Bool = false
        let originalText:String = "hello world"
        let testText:String = "lorem ipsumn"
        self.view.listener = { (text:String) in
            XCTAssertEqual(testText, text, "Invalid text received")
            called = true
        }
        self.view.field.text = originalText
        let _:Bool = self.view.textField(self.view.field, shouldChangeCharactersIn:NSMakeRange(0, originalText.count),
                                         replacementString:testText)
        XCTAssertTrue(called, "Not called")
    }
}
