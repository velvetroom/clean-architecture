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
        self.view.content.rate.field.text = String()
        var property:RateViewModel = RateViewModel()
        property.amount = "lorem ipsum"
        self.view.presenter.viewModel.update(property:property)
        DispatchQueue.main.async {
            XCTAssertEqual(self.view.content.rate.field.text, property.amount, "Not updated")
            expect.fulfill()
        }
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testUpdateEuroWithViewModel() {
        let expect:XCTestExpectation = self.expectation(description:"Observer not updated")
        self.view.content.euro.field.text = String()
        var property:EuroViewModel = EuroViewModel()
        property.amount = "lorem ipsum"
        self.view.presenter.viewModel.update(property:property)
        DispatchQueue.main.async {
            XCTAssertEqual(self.view.content.euro.field.text, property.amount, "Not updated")
            expect.fulfill()
        }
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
    
    func testUpdateUsdWithViewModel() {
        let expect:XCTestExpectation = self.expectation(description:"Observer not updated")
        self.view.content.usd.field.text = String()
        var property:UsdViewModel = UsdViewModel()
        property.amount = "lorem ipsum"
        self.view.presenter.viewModel.update(property:property)
        DispatchQueue.main.async {
            XCTAssertEqual(self.view.content.usd.field.text, property.amount, "Not updated")
            expect.fulfill()
        }
        self.waitForExpectations(timeout:0.3, handler:nil)
    }
}
