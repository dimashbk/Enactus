//
//  AuthorizationTextField.swift
//  Enactus
//
//  Created by Dinmukhamed on 30.03.2023.
//
import UIKit

final class AuthorizationTextField: UITextField {
    
    private let edgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 10)
    
    private let rightViewInsets = UIEdgeInsets(top: 0, left: 266, bottom: 16, right: 0)
    
    var onClick = false
    
    lazy var eyeButton: UIButton = {
        let eyeButton = UIButton()
        eyeButton.setImage(.init(named: "EyeButton"), for: .normal)
        eyeButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        eyeButton.addTarget(self, action: #selector(showText), for: .touchUpInside)
        return eyeButton
    }()
    
    init(placeholder: String){
        super.init(frame
                   : .zero)
        setupTF(placeholder: placeholder)
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUnderline()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: edgeInsets)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: edgeInsets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return  bounds.inset(by: edgeInsets)
    }
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return  bounds.inset(by: rightViewInsets)
    }
    
    private func setupTF(placeholder: String){
        let redPlaceholderText = NSAttributedString(string: placeholder,
                                                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.enHalfGray])
                
        self.attributedPlaceholder = redPlaceholderText
        setupButton()
        
    }
    
    private func setupUnderline() {
        let bottomLayer = CALayer()
        bottomLayer.frame = CGRect(x: 0, y: self.frame.height, width: self.frame.width - 48, height: 1)
        bottomLayer.backgroundColor = UIColor.enHalfGray.cgColor
        self.borderStyle = .none
        self.layer.addSublayer(bottomLayer)
    }
    
    private func setupButton() {
        self.rightViewMode = .always
        self.rightView = eyeButton
    }
    
    @objc func showText() {
        if onClick {
                self.isSecureTextEntry = false
            } else {
                self.isSecureTextEntry = true
            }
            onClick = !onClick
    }
    
}
