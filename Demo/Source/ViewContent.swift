import UIKit

class ViewContent:UIView {
    weak var labelTitle:UILabel!
    weak var inputRate:ViewInput!
    weak var inputEuro:ViewInput!
    weak var inputUsd:ViewInput!
    
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
        let labelTitle:UILabel = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.text = NSLocalizedString("ViewContent_LabelTitle", comment:String())
        labelTitle.numberOfLines = 0
        self.labelTitle = labelTitle
        self.addSubview(labelTitle)
    }
    
    private func makeInputRate() {
        let inputRate:ViewInput = ViewInput()
        inputRate.label.text = NSLocalizedString("ViewContent_LabelInputRate", comment:String())
        self.inputRate = inputRate
        self.addSubview(inputRate)
    }
    
    private func makeInputEuro() {
        let inputEuro:ViewInput = ViewInput()
        inputEuro.label.text = NSLocalizedString("ViewContent_LabelInputEuro", comment:String())
        self.inputEuro = inputEuro
        self.addSubview(inputEuro)
    }
    
    private func makeInputUsd() {
        let inputUsd:ViewInput = ViewInput()
        inputUsd.label.text = NSLocalizedString("ViewContent_LabelInputUsd", comment:String())
        self.inputUsd = inputUsd
        self.addSubview(inputUsd)
    }
    
    private func layoutTitle() {
        if #available(iOS 11.0, *) {
            self.labelTitle.topAnchor.constraint(equalTo:self.safeAreaLayoutGuide.topAnchor,
                                                 constant:ViewConstants.Title.top).isActive = true
        } else {
            self.labelTitle.topAnchor.constraint(equalTo:self.topAnchor,
                                                 constant:ViewConstants.Title.top).isActive = true
        }
        self.labelTitle.leftAnchor.constraint(equalTo:self.leftAnchor, constant:Constants.left).isActive = true
        self.labelTitle.rightAnchor.constraint(equalTo:self.rightAnchor, constant:-Constants.left).isActive = true
        self.labelTitle.heightAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
    }
    
    private func layoutInputRate() {
        self.inputRate.topAnchor.constraint(equalTo:self.labelTitle.bottomAnchor,
                                            constant:ViewConstants.Title.bottom).isActive = true
        self.inputRate.leftAnchor.constraint(equalTo:self.leftAnchor, constant:Constants.left).isActive = true
        self.inputRate.widthAnchor.constraint(equalToConstant:ViewConstants.Input.width).isActive = true
        self.inputRate.heightAnchor.constraint(equalToConstant:ViewConstants.Input.height).isActive = true
    }
    
    private func layoutInputEuro() {
        self.inputEuro.topAnchor.constraint(equalTo:self.inputRate.bottomAnchor).isActive = true
        self.inputEuro.leftAnchor.constraint(equalTo:self.leftAnchor, constant:Constants.left).isActive = true
        self.inputEuro.widthAnchor.constraint(equalToConstant:ViewConstants.Input.width).isActive = true
        self.inputEuro.heightAnchor.constraint(equalToConstant:ViewConstants.Input.height).isActive = true
    }
    
    private func layoutInputUsd() {
        self.inputUsd.topAnchor.constraint(equalTo:self.inputEuro.bottomAnchor).isActive = true
        self.inputUsd.leftAnchor.constraint(equalTo:self.leftAnchor, constant:Constants.left).isActive = true
        self.inputUsd.widthAnchor.constraint(equalToConstant:ViewConstants.Input.width).isActive = true
        self.inputUsd.heightAnchor.constraint(equalToConstant:ViewConstants.Input.height).isActive = true
    }
}

private struct Constants {
    static let left:CGFloat = 20
}
