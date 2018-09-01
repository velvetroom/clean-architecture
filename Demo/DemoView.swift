import UIKit
import CleanArchitecture

class DemoView:View<DemoInteractor, DemoPresenter> {
    private weak var header:UILabel!
    private weak var rate:InputView!
    private weak var euro:InputView!
    private weak var usd:InputView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("View.title", comment:String())
        makeOutlets()
        layoutOutlets()
        configureViewModel()
    }
    
    private func makeOutlets() {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.text = NSLocalizedString("ViewContent.header", comment:String())
        header.numberOfLines = 0
        view.addSubview(header)
        self.header = header
        
        let rate = InputView()
        rate.label.text = NSLocalizedString("ViewContent.rate", comment:String())
        rate.listener = presenter.updatedRate
        view.addSubview(rate)
        self.rate = rate
        
        let euro = InputView()
        euro.label.text = NSLocalizedString("ViewContent.euro", comment:String())
        euro.listener = presenter.updatedEuro
        view.addSubview(euro)
        self.euro = euro
        
        let usd = InputView()
        usd.label.text = NSLocalizedString("ViewContent.usd", comment:String())
        usd.listener = presenter.updatedUsd
        view.addSubview(usd)
        self.usd = usd
    }
    
    private func layoutOutlets() {
        header.leftAnchor.constraint(equalTo:view.leftAnchor, constant:20).isActive = true
        header.rightAnchor.constraint(equalTo:view.rightAnchor, constant:-20).isActive = true
        
        rate.topAnchor.constraint(equalTo:header.bottomAnchor, constant:20).isActive = true
        rate.leftAnchor.constraint(equalTo:view.leftAnchor, constant:20).isActive = true
        rate.widthAnchor.constraint(equalToConstant:150).isActive = true
        rate.heightAnchor.constraint(equalToConstant:80).isActive = true
        
        euro.topAnchor.constraint(equalTo:rate.bottomAnchor).isActive = true
        euro.leftAnchor.constraint(equalTo:view.leftAnchor, constant:20).isActive = true
        euro.widthAnchor.constraint(equalToConstant:150).isActive = true
        euro.heightAnchor.constraint(equalToConstant:80).isActive = true
        
        usd.topAnchor.constraint(equalTo:euro.bottomAnchor).isActive = true
        usd.leftAnchor.constraint(equalTo:view.leftAnchor, constant:20).isActive = true
        usd.widthAnchor.constraint(equalToConstant:150).isActive = true
        usd.heightAnchor.constraint(equalToConstant:80).isActive = true
        
        if #available(iOS 11.0, *) {
            header.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant:20).isActive = true
        } else {
            header.topAnchor.constraint(equalTo:view.topAnchor, constant:20).isActive = true
        }
    }
    
    private func configureViewModel() {
        presenter.viewModels.observe { [weak self] (viewModel:DemoViewModel) in
            self?.rate.field.text = viewModel.rate
            self?.euro.field.text = viewModel.euro
            self?.usd.field.text = viewModel.usd
        }
        presenter.viewModels.observe { [weak self] (viewModel:RateViewModel) in
            self?.rate.field.text = viewModel.amount
        }
        presenter.viewModels.observe { [weak self] (viewModel:EuroViewModel) in
            self?.euro.field.text = viewModel.amount
        }
        presenter.viewModels.observe { [weak self] (viewModel:UsdViewModel) in
            self?.usd.field.text = viewModel.amount
        }
    }
}
