import UIKit

class ViewInput:UIView, UITextFieldDelegate {
    weak var label:UILabel!
    weak var field:UITextField!
    var delegateCallback:((String) -> Void)?
    
    init() {
        super.init(frame:CGRect.zero)
        self.configureView()
        self.makeOutlets()
        self.layoutOutlets()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard
            let currentText:String = textField.text,
            let range:Range = Range(range, in:currentText)
        else { return true }
        let updatedText:String = currentText.replacingCharacters(in:range, with:string)
        self.delegateCallback?(updatedText)
        return true
    }
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func makeOutlets() {
        self.makeLabel()
        self.makeField()
    }
    
    private func layoutOutlets() {
        self.layoutLabel()
        self.layoutField()
    }
    
    private func makeLabel() {
        let label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.label = label
        self.addSubview(label)
    }
    
    private func makeField() {
        let field:UITextField = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.borderStyle = UITextBorderStyle.roundedRect
        field.autocorrectionType = UITextAutocorrectionType.no
        field.spellCheckingType = UITextSpellCheckingType.no
        field.textAlignment = NSTextAlignment.right
        field.keyboardType = UIKeyboardType.numbersAndPunctuation
        field.returnKeyType = UIReturnKeyType.done
        field.delegate = self
        self.field = field
        self.addSubview(field)
    }
    
    private func layoutLabel() {
        self.label.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        self.label.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        self.label.widthAnchor.constraint(greaterThanOrEqualToConstant:0).isActive = true
        self.label.heightAnchor.constraint(equalToConstant:ViewConstants.InputLabel.height).isActive = true
    }
    
    private func layoutField() {
        self.field.topAnchor.constraint(equalTo:self.label.bottomAnchor).isActive = true
        self.field.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        self.field.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
        self.field.heightAnchor.constraint(equalToConstant:ViewConstants.InputField.height).isActive = true
    }
}
