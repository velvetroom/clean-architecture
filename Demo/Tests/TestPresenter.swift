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
}
