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
        var called:Bool = false
        let string:String = "5"
        self.view.presenter.viewModel.observe { (viewModel:UsdViewModel) in
            called = true
        }
        self.view.presenter.interactor.exchanger.exchange.euro = 1
        self.view.presenter.interactor.exchanger.exchange.usd = 1
        called = false
        self.presenter.updatedRate(string:string)
        XCTAssertTrue(called, "Not updated")
    }
    
    func testUpdateViewModelOnUpdateEuro() {
        var called:Bool = false
        let string:String = "5.00"
        self.view.presenter.viewModel.observe { (viewModel:UsdViewModel) in
            called = true
        }
        self.view.presenter.interactor.exchanger.exchange.rate = 1
        self.view.presenter.interactor.exchanger.exchange.usd = 1
        called = false
        self.presenter.updatedEuro(string:string)
        XCTAssertTrue(called, "Not updated")
    }
    
    func testUpdateViewModelOnUpdateUsd() {
        var called:Bool = false
        let string:String = "5"
        self.view.presenter.viewModel.observe { (viewModel:EuroViewModel) in
            called = true
        }
        self.view.presenter.interactor.exchanger.exchange.rate = 1
        self.view.presenter.interactor.exchanger.exchange.euro = 1
        called = false
        self.presenter.updatedUsd(string:string)
        XCTAssertTrue(called, "Not updated")
    }
}
