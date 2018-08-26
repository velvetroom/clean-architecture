import UIKit
import CleanArchitecture

class DemoView:View<DemoPresenter> {
    private weak var header:UILabel!
    private weak var rate:InputView!
    private weak var euro:InputView!
    private weak var usd:InputView!
    private static let left:CGFloat = 20
    private static let inputWidth:CGFloat = 150
    private static let inputHeight:CGFloat = 80
    private static let titleTop:CGFloat = 20
    
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
        header.leftAnchor.constraint(equalTo:view.leftAnchor, constant:DemoView.left).isActive = true
        header.rightAnchor.constraint(equalTo:view.rightAnchor, constant:-DemoView.left).isActive = true
        
        rate.topAnchor.constraint(equalTo:header.bottomAnchor, constant:20).isActive = true
        rate.leftAnchor.constraint(equalTo:view.leftAnchor, constant:DemoView.left).isActive = true
        rate.widthAnchor.constraint(equalToConstant:DemoView.inputWidth).isActive = true
        rate.heightAnchor.constraint(equalToConstant:DemoView.inputHeight).isActive = true
        
        euro.topAnchor.constraint(equalTo:rate.bottomAnchor).isActive = true
        euro.leftAnchor.constraint(equalTo:view.leftAnchor, constant:DemoView.left).isActive = true
        euro.widthAnchor.constraint(equalToConstant:DemoView.inputWidth).isActive = true
        euro.heightAnchor.constraint(equalToConstant:DemoView.inputHeight).isActive = true
        
        usd.topAnchor.constraint(equalTo:euro.bottomAnchor).isActive = true
        usd.leftAnchor.constraint(equalTo:view.leftAnchor, constant:DemoView.left).isActive = true
        usd.widthAnchor.constraint(equalToConstant:DemoView.inputWidth).isActive = true
        usd.heightAnchor.constraint(equalToConstant:DemoView.inputHeight).isActive = true
        
        if #available(iOS 11.0, *) {
            header.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor,
                                        constant:DemoView.titleTop).isActive = true
        } else {
            header.topAnchor.constraint(equalTo:view.topAnchor, constant:DemoView.titleTop).isActive = true
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
