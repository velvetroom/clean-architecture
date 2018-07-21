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
        self.view.content.rate.field.text = String()
        var property:RateViewModel = RateViewModel()
        property.amount = "lorem ipsum"
        self.view.presenter.viewModel.update(property:property)
        XCTAssertEqual(self.view.content.rate.field.text, property.amount, "Not updated")
    }
    
    func testUpdateEuroWithViewModel() {
        self.view.content.euro.field.text = String()
        var property:EuroViewModel = EuroViewModel()
        property.amount = "lorem ipsum"
        self.view.presenter.viewModel.update(property:property)
        XCTAssertEqual(self.view.content.euro.field.text, property.amount, "Not updated")
    }
    
    func testUpdateUsdWithViewModel() {
        self.view.content.usd.field.text = String()
        var property:UsdViewModel = UsdViewModel()
        property.amount = "lorem ipsum"
        self.view.presenter.viewModel.update(property:property)
        XCTAssertEqual(self.view.content.usd.field.text, property.amount, "Not updated")
    }
}
