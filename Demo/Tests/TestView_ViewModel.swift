import XCTest
@testable import Demo

class TestView_ViewModel:XCTestCase {
    private var view:DemoView!
    
    override func setUp() {
        super.setUp()
        self.view = DemoView()
        self.view.viewDidLoad()
    }
    
    func testUpdateRateWithViewModel() {
        let expect:XCTestExpectation = self.expectation(description:"Observer not updated")
        self.view.rate.field.text = String()
        var property:RateViewModel = RateViewModel()
        property.amount = "lorem ipsum"
        self.view.presenter.viewModels.update(viewModel:property)
        DispatchQueue.main.async {
            XCTAssertEqual(self.view.rate.field.text, property.amount, "Not updated")
            expect.fulfill()
        }
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testUpdateEuroWithViewModel() {
        let expect:XCTestExpectation = self.expectation(description:"Observer not updated")
        self.view.euro.field.text = String()
        var property:EuroViewModel = EuroViewModel()
        property.amount = "lorem ipsum"
        self.view.presenter.viewModels.update(viewModel:property)
        DispatchQueue.main.async {
            XCTAssertEqual(self.view.euro.field.text, property.amount, "Not updated")
            expect.fulfill()
        }
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testUpdateUsdWithViewModel() {
        let expect:XCTestExpectation = self.expectation(description:"Observer not updated")
        self.view.usd.field.text = String()
        var property:UsdViewModel = UsdViewModel()
        property.amount = "lorem ipsum"
        self.view.presenter.viewModels.update(viewModel:property)
        DispatchQueue.main.async {
            XCTAssertEqual(self.view.usd.field.text, property.amount, "Not updated")
            expect.fulfill()
        }
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
}
