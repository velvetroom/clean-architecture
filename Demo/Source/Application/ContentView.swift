import UIKit

class ContentView:UIView {
    weak var title:UILabel!
    weak var rate:InputView!
    weak var euro:InputView!
    weak var usd:InputView!
    
    init() {
        super.init(frame:CGRect.zero)
        self.makeOutlets()
        self.layoutOutlets()
    }
    
    required init?(coder:NSCoder) { return nil }
    
    private func makeOutlets() {
        self.makeTitle()
        self.makeInputRate()
        self.makeInputEuro()
        self.makeInputUsd()
    }
    
    private func layoutOutlets() {
        self.layoutTitle()
        self.layoutInputRate()
        self.layoutInputEuro()
        self.layoutInputUsd()
    }
    
    private func makeTitle() {
        let title:UILabel = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = NSLocalizedString("ViewContent_LabelTitle", comment:String())
        title.numberOfLines = 0
        self.title = title
        self.addSubview(title)
    }
    
    private func makeInputRate() {
        let rate:InputView = InputView()
        rate.label.text = NSLocalizedString("ViewContent_LabelInputRate", comment:String())
        self.rate = rate
        self.addSubview(rate)
    }
    
    private func makeInputEuro() {
        let euro:InputView = InputView()
        euro.label.text = NSLocalizedString("ViewContent_LabelInputEuro", comment:String())
        self.euro = euro
        self.addSubview(euro)
    }
    
    private func makeInputUsd() {
        let usd:InputView = InputView()
        usd.label.text = NSLocalizedString("ViewContent_LabelInputUsd", comment:String())
        self.usd = usd
        self.addSubview(usd)
    }
    
    private func layoutTitle() {
        if #available(iOS 11.0, *) {
            self.title.topAnchor.constraint(equalTo:self.safeAreaLayoutGuide.topAnchor,
                                                 constant:Constants.titleTop).isActive = true
        } else {
            self.title.topAnchor.constraint(equalTo:self.topAnchor, constant:Constants.titleTop).isActive = true
        }
        self.title.leftAnchor.constraint(equalTo:self.leftAnchor, constant:Constants.left).isActive = true
        self.title.rightAnchor.constraint(equalTo:self.rightAnchor, constant:-Constants.left).isActive = true
        self.title.heightAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
    }
    
    private func layoutInputRate() {
        self.rate.topAnchor.constraint(equalTo:self.title.bottomAnchor,
                                            constant:Constants.titleBottom).isActive = true
        self.rate.leftAnchor.constraint(equalTo:self.leftAnchor, constant:Constants.left).isActive = true
        self.rate.widthAnchor.constraint(equalToConstant:Constants.inputWidth).isActive = true
        self.rate.heightAnchor.constraint(equalToConstant:Constants.inputHeight).isActive = true
    }
    
    private func layoutInputEuro() {
        self.euro.topAnchor.constraint(equalTo:self.rate.bottomAnchor).isActive = true
        self.euro.leftAnchor.constraint(equalTo:self.leftAnchor, constant:Constants.left).isActive = true
        self.euro.widthAnchor.constraint(equalToConstant:Constants.inputWidth).isActive = true
        self.euro.heightAnchor.constraint(equalToConstant:Constants.inputHeight).isActive = true
    }
    
    private func layoutInputUsd() {
        self.usd.topAnchor.constraint(equalTo:self.euro.bottomAnchor).isActive = true
        self.usd.leftAnchor.constraint(equalTo:self.leftAnchor, constant:Constants.left).isActive = true
        self.usd.widthAnchor.constraint(equalToConstant:Constants.inputWidth).isActive = true
        self.usd.heightAnchor.constraint(equalToConstant:Constants.inputHeight).isActive = true
    }
}

private struct Constants {
    static let left:CGFloat = 20
    static let inputWidth:CGFloat = 150
    static let inputHeight:CGFloat = 80
    static let titleBottom:CGFloat = 20
    static let titleTop:CGFloat = 20
}
