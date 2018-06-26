import XCTest
@testable import Demo

class TestPresenter:XCTestCase {
    private var view:View!
    private var presenter:Presenter!
    
    override func setUp() {
        super.setUp()
        self.view = View()
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
        var property:ViewModelUsd = self.view.viewModel.property()
        property.observing = { (viewModel:ViewModelUsd) in called = true }
        self.view.viewModel.update(property:property)
        called = false
        self.presenter.updatedRate(string:String())
        XCTAssertTrue(called, "Not updated")
    }
    
    func testUpdateViewModelOnUpdateEuro() {
        var called:Bool = false
        var property:ViewModelUsd = self.view.viewModel.property()
        property.observing = { (viewModel:ViewModelUsd) in called = true }
        self.view.viewModel.update(property:property)
        called = false
        self.presenter.updatedEuro(string:String())
        XCTAssertTrue(called, "Not updated")
    }
    
    func testUpdateViewModelOnUpdateUsd() {
        var called:Bool = false
        var property:ViewModelEuro = self.view.viewModel.property()
        property.observing = { (viewModel:ViewModelEuro) in called = true }
        self.view.viewModel.update(property:property)
        called = false
        self.presenter.updatedUsd(string:String())
        XCTAssertTrue(called, "Not updated")
    }
}
