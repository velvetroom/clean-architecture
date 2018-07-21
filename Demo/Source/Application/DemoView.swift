import UIKit
import CleanArchitecture

class DemoView:View<Presenter, ContentView> {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.configureOutlets()
        self.configureViewModel()
    }
    
    private func configureView() {
        self.title = NSLocalizedString("View_Title", comment:String())
    }
    
    private func configureOutlets() {
        self.content.rate.listener = self.presenter.updatedRate
        self.content.euro.listener = self.presenter.updatedEuro
        self.content.usd.listener = self.presenter.updatedUsd
    }
    
    private func configureViewModel() {
        self.configureRateViewModel()
        self.configureEuroViewModel()
        self.configureUsdViewModel()
    }
    
    private func configureRateViewModel() {
        self.presenter.viewModel.observe { [weak self] (property:RateViewModel) in
            self?.content.rate.field.text = property.amount
        }
    }
    
    private func configureEuroViewModel() {
        self.presenter.viewModel.observe { [weak self] (property:EuroViewModel) in
            self?.content.euro.field.text = property.amount
        }
    }
    
    private func configureUsdViewModel() {
        self.presenter.viewModel.observe { [weak self] (property:UsdViewModel) in
            self?.content.usd.field.text = property.amount
        }
    }
}
