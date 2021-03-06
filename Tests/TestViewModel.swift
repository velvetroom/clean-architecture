import XCTest
@testable import CleanArchitecture

class TestViewModel:XCTestCase {
    private var presenter:MockPresenter!
    private var propertyA:MockViewModel!
    private var propertyB:MockSecondViewModel!
    
    override func setUp() {
        presenter = MockPresenter()
        propertyA = MockViewModel()
        propertyB = MockSecondViewModel()
    }
    
    func testUpdatesProperty() {
        let expect = expectation(description:String())
        presenter.viewModel { (viewModel:MockViewModel) in
            XCTAssertEqual("hello world", viewModel.name)
            expect.fulfill()
        }
        var property = MockViewModel()
        property.name = "hello world"
        presenter.update(viewModel:property)
        waitForExpectations(timeout:1, handler:nil)
    }
    
    func testNotifyObserver() {
        var notified = false
        let expectNotified = expectation(description:String())
        let expectAfterCopy = expectation(description:String())
        presenter.viewModel { (viewModel:MockViewModel) in
            if notified == false {
                notified = true
                expectNotified.fulfill()
                XCTAssertEqual("hello world", viewModel.name)
            } else {
                XCTAssertEqual("lorem ipsum", viewModel.name)
                expectAfterCopy.fulfill()
            }
        }
        propertyA.name = "hello world"
        presenter.update(viewModel:propertyA)
        propertyA.name = "lorem ipsum"
        presenter.update(viewModel:propertyA)
        waitForExpectations(timeout:1, handler:nil)
    }
    
    func testNotifyObserverWithOptional() {
        let expect = expectation(description:String())
        presenter.viewModel { (viewModel:MockViewModel) in
            expect.fulfill()
        }
        presenter.update(viewModel:MockViewModel() as MockViewModel?)
        waitForExpectations(timeout:1, handler:nil)
    }
    
    func testReplacesExistingPropertyOfSameType() {
        presenter.update(viewModel:MockViewModel())
        presenter.update(viewModel:MockViewModel())
        presenter.update(viewModel:MockViewModel())
        presenter.update(viewModel:MockViewModel())
        presenter.update(viewModel:MockViewModel())
        presenter.update(viewModel:MockViewModel())
        XCTAssertEqual(1, presenter.viewModels.count)
    }
    
    func testUpdateObserver() {
        let expect = expectation(description:String())
        let view = MockView()
        view.startObserving()
        view.onPropertyUpdated = { expect.fulfill() }
        view.presenter.update(viewModel:MockViewModel())
        waitForExpectations(timeout:1, handler:nil)
    }
    
    func testNotRetainingObserver() {
        let expect = expectation(description:String())
        let container = MockContainer()
        container.view = MockView()
        container.view?.startObserving()
        container.view?.onPropertyUpdated = { expect.fulfill() }
        container.view?.presenter.update(viewModel:MockViewModel())
        container.view = nil
        XCTAssertNil(container.view)
        waitForExpectations(timeout:1, handler:nil)
    }
    
    func testUpdatesObserverOnMainThread() {
        let expect = expectation(description:String())
        let view = MockView()
        view.startObserving()
        view.onPropertyUpdated = {
            XCTAssertEqual(Thread.main, Thread.current)
            expect.fulfill()
        }
        DispatchQueue.global(qos:.background).async { view.presenter.update(viewModel:MockViewModel()) }
        waitForExpectations(timeout:1, handler:nil)
    }
}
