import XCTest
@testable import Demo

class TestView:XCTestCase {
    private var view:View!
    
    override func setUp() {
        super.setUp()
        self.view = View()
    }
    
    func testAssignedDelegateToInputs() {
        self.view.viewDidLoad()
        XCTAssertNotNil(self.view.content.inputRate.delegateCallback, "Failed to assign delegate")
        XCTAssertNotNil(self.view.content.inputEuro.delegateCallback, "Failed to assign delegate")
        XCTAssertNotNil(self.view.content.inputUsd.delegateCallback, "Failed to assign delegate")
    }
    
    func testUpdateRateCallsPresenter() {
        var called:Bool = false
        let presenter:MockPresenter = MockPresenter()
        presenter.viewModel = self.view.presenter.viewModel
        presenter.interactor = self.view.presenter.interactor
        self.view.presenter = presenter
        self.view.viewDidLoad()
        presenter.onUpdatedRate = { called = true }
        let _:Bool = self.view.content.inputRate.textField(UITextField(), shouldChangeCharactersIn:NSMakeRange(0, 0),
                                                           replacementString:String())
        XCTAssertTrue(called, "Not called")
    }
    
    func testUpdateEuroCallsPresenter() {
        var called:Bool = false
        let presenter:MockPresenter = MockPresenter()
        presenter.viewModel = self.view.presenter.viewModel
        presenter.interactor = self.view.presenter.interactor
        self.view.presenter = presenter
        self.view.viewDidLoad()
        presenter.onUpdatedEuro = { called = true }
        let _:Bool = self.view.content.inputEuro.textField(UITextField(), shouldChangeCharactersIn:NSMakeRange(0, 0),
                                                           replacementString:String())
        XCTAssertTrue(called, "Not called")
    }
    
    func testUpdateUsdCallsPresenter() {
        var called:Bool = false
        let presenter:MockPresenter = MockPresenter()
        presenter.viewModel = self.view.presenter.viewModel
        presenter.interactor = self.view.presenter.interactor
        self.view.presenter = presenter
        self.view.viewDidLoad()
        presenter.onUpdatedUsd = { called = true }
        let _:Bool = self.view.content.inputUsd.textField(UITextField(), shouldChangeCharactersIn:NSMakeRange(0, 0),
                                                           replacementString:String())
        XCTAssertTrue(called, "Not called")
    }
}
