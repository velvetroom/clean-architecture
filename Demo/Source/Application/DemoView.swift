import UIKit
import CleanArchitecture

class DemoView:View<DemoPresenter> {
    weak var header:UILabel!
    weak var rate:InputView!
    weak var euro:InputView!
    weak var usd:InputView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("View.title", comment:String())
        self.makeOutlets()
        self.layoutOutlets()
        self.configureViewModel()
    }
    
    private func makeOutlets() {
        let header:UILabel = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.text = NSLocalizedString("ViewContent.header", comment:String())
        header.numberOfLines = 0
        self.header = header
        self.view.addSubview(header)
        
        let rate:InputView = InputView()
        rate.label.text = NSLocalizedString("ViewContent.rate", comment:String())
        rate.listener = self.presenter.updatedRate
        self.rate = rate
        self.view.addSubview(rate)
        
        let euro:InputView = InputView()
        euro.label.text = NSLocalizedString("ViewContent.euro", comment:String())
        euro.listener = self.presenter.updatedEuro
        self.euro = euro
        self.view.addSubview(euro)
        
        let usd:InputView = InputView()
        usd.label.text = NSLocalizedString("ViewContent.usd", comment:String())
        usd.listener = self.presenter.updatedUsd
        self.usd = usd
        self.view.addSubview(usd)
    }
    
    private func layoutOutlets() {
        if #available(iOS 11.0, *) {
            self.header.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor,
                                             constant:Constants.titleTop).isActive = true
        } else {
            self.header.topAnchor.constraint(equalTo:self.view.topAnchor, constant:Constants.titleTop).isActive = true
        }
        self.header.leftAnchor.constraint(equalTo:self.view.leftAnchor, constant:Constants.left).isActive = true
        self.header.rightAnchor.constraint(equalTo:self.view.rightAnchor, constant:-Constants.left).isActive = true
        self.header.heightAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
        
        self.rate.topAnchor.constraint(equalTo:self.header.bottomAnchor,
                                       constant:Constants.titleBottom).isActive = true
        self.rate.leftAnchor.constraint(equalTo:self.view.leftAnchor, constant:Constants.left).isActive = true
        self.rate.widthAnchor.constraint(equalToConstant:Constants.inputWidth).isActive = true
        self.rate.heightAnchor.constraint(equalToConstant:Constants.inputHeight).isActive = true
        
        self.euro.topAnchor.constraint(equalTo:self.rate.bottomAnchor).isActive = true
        self.euro.leftAnchor.constraint(equalTo:self.view.leftAnchor, constant:Constants.left).isActive = true
        self.euro.widthAnchor.constraint(equalToConstant:Constants.inputWidth).isActive = true
        self.euro.heightAnchor.constraint(equalToConstant:Constants.inputHeight).isActive = true
        
        self.usd.topAnchor.constraint(equalTo:self.euro.bottomAnchor).isActive = true
        self.usd.leftAnchor.constraint(equalTo:self.view.leftAnchor, constant:Constants.left).isActive = true
        self.usd.widthAnchor.constraint(equalToConstant:Constants.inputWidth).isActive = true
        self.usd.heightAnchor.constraint(equalToConstant:Constants.inputHeight).isActive = true
        
    }
    
    private func configureViewModel() {
        self.presenter.viewModels.observe { [weak self] (viewModel:DemoViewModel) in
            self?.rate.field.text = viewModel.rate
            self?.euro.field.text = viewModel.euro
            self?.usd.field.text = viewModel.usd
        }
        self.presenter.viewModels.observe { [weak self] (viewModel:RateViewModel) in
            self?.rate.field.text = viewModel.amount
        }
        self.presenter.viewModels.observe { [weak self] (viewModel:EuroViewModel) in
            self?.euro.field.text = viewModel.amount
        }
        self.presenter.viewModels.observe { [weak self] (viewModel:UsdViewModel) in
            self?.usd.field.text = viewModel.amount
        }
    }
}

private struct Constants {
    static let left:CGFloat = 20
    static let inputWidth:CGFloat = 150
    static let inputHeight:CGFloat = 80
    static let titleBottom:CGFloat = 20
    static let titleTop:CGFloat = 20
}
