import UIKit

extension RemittanceController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        setupButtonColor()
    }
}
