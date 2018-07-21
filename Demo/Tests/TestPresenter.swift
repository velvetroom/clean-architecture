import XCTest
@testable import Demo

class TestPresenter:XCTestCase {
    private var view:DemoView!
    private var presenter:Presenter!
    
    override func setUp() {
        super.setUp()
        self.view = DemoView()
        self.presenter = self.view.presenter
    }
    
    func testValidateRateWithInteractor() {
        var validated:Bool = false
        let interactor:MockInteractor = MockInteractor()
        self.presenter.interactor = interactor
        interactor.onUpdateRate = { validated = true }
        self.presenter.updatedRate(string:String())
        XCTAssertTrue(validated, "Not validated")
    }
    
    func testValidateEuroWithInteractor() {
        var validated:Bool = false
        let interactor:MockInteractor = MockInteractor()
        self.presenter.interactor = interactor
        interactor.onUpdateEuro = { validated = true }
        self.presenter.updatedEuro(string:String())
        XCTAssertTrue(validated, "Not validated")
    }
    
    func testValidateUsdWithInteractor() {
        var validated:Bool = false
        let interactor:MockInteractor = MockInteractor()
        self.presenter.interactor = interactor
        interactor.onUpdateUsd = { validated = true }
        self.presenter.updatedUsd(string:String())
        XCTAssertTrue(validated, "Not validated")
    }
    
    func testUpdateViewModelOnUpdateRate() {
        let expect:XCTestExpectation = self.expectation(description:"Observer not updated")
        let string:String = "5"
        self.view.presenter.viewModel.observe { (viewModel:UsdViewModel) in expect.fulfill() }
        self.view.presenter.interactor.exchanger.exchange.euro = 1
        self.view.presenter.interactor.exchanger.exchange.usd = 1
        self.presenter.updatedRate(string:string)
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testUpdateViewModelOnUpdateEuro() {
        let expect:XCTestExpectation = self.expectation(description:"Observer not updated")
        let string:String = "5.00"
        self.view.presenter.viewModel.observe { (viewModel:UsdViewModel) in expect.fulfill() }
        self.view.presenter.interactor.exchanger.exchange.rate = 1
        self.view.presenter.interactor.exchanger.exchange.usd = 1
        self.presenter.updatedEuro(string:string)
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testUpdateViewModelOnUpdateUsd() {
        let expect:XCTestExpectation = self.expectation(description:"Observer not updated")
        let string:String = "5"
        self.view.presenter.viewModel.observe { (viewModel:EuroViewModel) in expect.fulfill() }
        self.view.presenter.interactor.exchanger.exchange.rate = 1
        self.view.presenter.interactor.exchanger.exchange.euro = 1
        self.presenter.updatedUsd(string:string)
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
}
