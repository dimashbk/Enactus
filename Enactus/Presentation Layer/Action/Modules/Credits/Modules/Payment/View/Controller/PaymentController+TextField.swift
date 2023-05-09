import UIKit

extension PaymentController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        setupButtonColor()
    }
}
