import UIKit
import CleanArchitecture

class View:CleanArchitecture.View<Presenter, ViewContent> {
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
        self.content.inputRate.delegateCallback = self.presenter.updatedRate
        self.content.inputEuro.delegateCallback = self.presenter.updatedEuro
        self.content.inputUsd.delegateCallback = self.presenter.updatedUsd
    }
    
    private func configureViewModel() {
        self.configureRateViewModel()
        self.configureEuroViewModel()
        self.configureUsdViewModel()
    }
    
    private func configureRateViewModel() {
        self.presenter.viewModel.observe { [weak self] (property:ViewModelRate) in
            self?.content.inputRate.field.text = property.amount
        }
    }
    
    private func configureEuroViewModel() {
        self.presenter.viewModel.observe { [weak self] (property:ViewModelEuro) in
            self?.content.inputEuro.field.text = property.amount
        }
    }
    
    private func configureUsdViewModel() {
        self.presenter.viewModel.observe { [weak self] (property:ViewModelUsd) in
            self?.content.inputUsd.field.text = property.amount
        }
    }
}
