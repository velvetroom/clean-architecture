import UIKit
import CleanArchitecture

class View:CleanArchitecture.View<Interactor, Presenter, ViewContent> {    
    override func didLoad() {
        super.didLoad()
        self.configureView()
        self.configureOutlets()
    }
    
    private func configureView() {
        self.title = NSLocalizedString("View_Title", comment:String())
    }
    
    private func configureOutlets() {
        self.content.inputRate.delegateCallback = self.presenter.updatedRate
        self.content.inputEuro.delegateCallback = self.presenter.updatedEuro
        self.content.inputUsd.delegateCallback = self.presenter.updatedUsd
    }
}
