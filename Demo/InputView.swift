import UIKit

class InputView:UIView, UITextFieldDelegate {
    weak var label:UILabel!
    weak var field:UITextField!
    var listener:((String) -> Void)?
    
    init() {
        super.init(frame:.zero)
        translatesAutoresizingMaskIntoConstraints = false
        makeOutlets()
        layoutOutlets()
    }
    
    required init?(coder:NSCoder) { return nil }
    
    func textField(_:UITextField, shouldChangeCharactersIn range:NSRange, replacementString string:String) -> Bool {
        if let currentText = field.text,
           let range = Range(range, in:currentText) {
            listener?(currentText.replacingCharacters(in:range, with:string))
        }
        return true
    }
    
    func textFieldShouldReturn(_:UITextField) -> Bool {
        field.resignFirstResponder()
        return true
    }
    
    private func makeOutlets() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        self.label = label
        
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.borderStyle = .roundedRect
        field.autocorrectionType = .no
        field.spellCheckingType = .no
        field.textAlignment = .right
        field.keyboardType = .numbersAndPunctuation
        field.returnKeyType = .done
        field.delegate = self
        addSubview(field)
        self.field = field
    }
    
    private func layoutOutlets() {
        label.topAnchor.constraint(equalTo:topAnchor).isActive = true
        label.leftAnchor.constraint(equalTo:leftAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant:30).isActive = true
        
        field.topAnchor.constraint(equalTo:label.bottomAnchor).isActive = true
        field.leftAnchor.constraint(equalTo:leftAnchor).isActive = true
        field.rightAnchor.constraint(equalTo:rightAnchor).isActive = true
        field.heightAnchor.constraint(equalToConstant:35).isActive = true
    }
}
