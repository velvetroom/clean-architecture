import UIKit
import CleanArchitecture

class View:CleanArchitecture.View<Interactor, Presenter, ViewContent> {    
    override func didLoad() {
        super.didLoad()
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
        var property:ViewModelRate = self.viewModel.property()
        property.observing = self.updated
        self.viewModel.update(property:property)
    }
    
    private func configureEuroViewModel() {
        var property:ViewModelEuro = self.viewModel.property()
        property.observing = self.updated
        self.viewModel.update(property:property)
    }
    
    private func configureUsdViewModel() {
        var property:ViewModelUsd = self.viewModel.property()
        property.observing = self.updated
        self.viewModel.update(property:property)
    }
    
    private func updated(viewModel:ViewModelRate) {
        self.content.inputRate.field.text = viewModel.amount
    }
    
    private func updated(viewModel:ViewModelEuro) {
        self.content.inputEuro.field.text = viewModel.amount
    }
    
    private func updated(viewModel:ViewModelUsd) {
        self.content.inputUsd.field.text = viewModel.amount
    }
}
