import XCTest
@testable import Demo

class TestView:XCTestCase {
    private var view:DemoView!
    
    override func setUp() {
        super.setUp()
        self.view = DemoView()
    }
    
    func testAssignedDelegateToInputs() {
        self.view.viewDidLoad()
        XCTAssertNotNil(self.view.rate.listener, "Failed to assign delegate")
        XCTAssertNotNil(self.view.euro.listener, "Failed to assign delegate")
        XCTAssertNotNil(self.view.usd.listener, "Failed to assign delegate")
    }
    
    func testUpdateRateCallsPresenter() {
        var called:Bool = false
        let presenter:MockPresenter = MockPresenter()
        presenter.viewModels = self.view.presenter.viewModels
        presenter.interactor = self.view.presenter.interactor
        self.view.presenter = presenter
        self.view.viewDidLoad()
        presenter.onUpdatedRate = { called = true }
        let _:Bool = self.view.rate.textField(UITextField(), shouldChangeCharactersIn:NSMakeRange(0, 0),
                                              replacementString:String())
        XCTAssertTrue(called, "Not called")
    }
    
    func testUpdateEuroCallsPresenter() {
        var called:Bool = false
        let presenter:MockPresenter = MockPresenter()
        presenter.viewModels = self.view.presenter.viewModels
        presenter.interactor = self.view.presenter.interactor
        self.view.presenter = presenter
        self.view.viewDidLoad()
        presenter.onUpdatedEuro = { called = true }
        let _:Bool = self.view.euro.textField(UITextField(), shouldChangeCharactersIn:NSMakeRange(0, 0),
                                              replacementString:String())
        XCTAssertTrue(called, "Not called")
    }
    
    func testUpdateUsdCallsPresenter() {
        var called:Bool = false
        let presenter:MockPresenter = MockPresenter()
        presenter.viewModels = self.view.presenter.viewModels
        presenter.interactor = self.view.presenter.interactor
        self.view.presenter = presenter
        self.view.viewDidLoad()
        presenter.onUpdatedUsd = { called = true }
        let _:Bool = self.view.usd.textField(UITextField(), shouldChangeCharactersIn:NSMakeRange(0, 0),
                                             replacementString:String())
        XCTAssertTrue(called, "Not called")
    }
}
