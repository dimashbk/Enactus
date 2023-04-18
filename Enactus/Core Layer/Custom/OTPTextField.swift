//
//  OTPTextField.swift
//  Enactus
//
//  Created by Dinmukhamed on 03.04.2023.
//

import UIKit

class OTPTextField: UITextField {
    
  weak var previousTextField: OTPTextField?
  weak var nextTextField: OTPTextField?
    
  override public func deleteBackward() {
        text = ""
        previousTextField?.becomeFirstResponder()
   }
    
  func setupUnderline() {
        let bottomLayer = CALayer()
        bottomLayer.frame = CGRect(x: 30, y: 40, width: self.frame.width - 20, height: 2)
        bottomLayer.backgroundColor = UIColor.enHalfGray.cgColor
        self.borderStyle = .none
        self.layer.addSublayer(bottomLayer)
    }
    
}
