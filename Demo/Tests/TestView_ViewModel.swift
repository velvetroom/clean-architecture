import XCTest
@testable import Demo

class TestView_ViewModel:XCTestCase {
    private var view:View!
    
    override func setUp() {
        super.setUp()
        self.view = View()
        self.view.didLoad()
    }
    
    func testUpdateRateWithViewModel() {
        self.view.content.inputRate.field.text = String()
        var property:ViewModelRate = self.view.viewModel.property()
        property.amount = "lorem ipsum"
        self.view.viewModel.update(property:property)
        XCTAssertEqual(self.view.content.inputRate.field.text, property.amount, "Not updated")
    }
    
    func testUpdateEuroWithViewModel() {
        self.view.content.inputEuro.field.text = String()
        var property:ViewModelEuro = self.view.viewModel.property()
        property.amount = "lorem ipsum"
        self.view.viewModel.update(property:property)
        XCTAssertEqual(self.view.content.inputEuro.field.text, property.amount, "Not updated")
    }
    
    func testUpdateUsdWithViewModel() {
        self.view.content.inputUsd.field.text = String()
        var property:ViewModelUsd = self.view.viewModel.property()
        property.amount = "lorem ipsum"
        self.view.viewModel.update(property:property)
        XCTAssertEqual(self.view.content.inputUsd.field.text, property.amount, "Not updated")
    }
}
