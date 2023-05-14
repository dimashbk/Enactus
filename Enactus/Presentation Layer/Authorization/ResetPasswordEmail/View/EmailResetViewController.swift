//
//  EmailResetViewController.swift
//  Enactus
//
//  Created by Dinmukhamed on 20.04.2023.
//

import UIKit

final class EmailResetViewController: UIViewController {
    
    var viewModel: EmailResetViewModel?
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .init(named: "authorizathionBackground")
        return imageView
    }()
    
    private lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .init(named: "logoImage")
        return imageView
    }()
    
    private lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите email для восстановления пароля"
        label.numberOfLines = 0
        label.font = UIFont(name: "Mulish", size: 32)
        label.textColor = .white
        return label
    }()
    
    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "Мы отправим на вашу электронную почту 6-значный код, с помощью которого вы сможете восстановить доступ к вашему аккаунту."
        label.font = UIFont(name: "Mulish", size: 16)
        label.numberOfLines = 0
        label.textColor = .enHalfGray
        return label
    }()
    
    private lazy var emailTextField: AuthorizationTextField = {
        let textField = AuthorizationTextField(placeholder: "Email")
        textField.eyeButton.isHidden = true
        textField.textColor = .enWhite
        return textField
    }()
    
    private lazy var sendReferenceButton: TwoStateButton = {
        let button = TwoStateButton()
        button.changeState(state: .disabled)
        button.setTitle("Отправить ссылку", for: .normal)
        button.addTarget(self, action: #selector(moveToOTP), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AuthorizationService.shared.authorizationPath = .resetPassword
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        [backgroundImage, logoImage, firstLabel,
         secondLabel, emailTextField, sendReferenceButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        logoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(68)
            make.left.equalToSuperview().inset(24)
        }
        firstLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(view.bounds.width / 2)
            make.left.right.equalToSuperview().inset(24)
        }
        secondLabel.snp.makeConstraints { make in
            make.top.equalTo(firstLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(24)
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(secondLabel.snp.bottom).offset(32)
            make.height.equalTo(36)
            make.left.right.equalTo(24)
        }
        sendReferenceButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(view.bounds.width / 2 + 15)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(48)
        }
    }
    @objc func moveToOTP() {
        viewModel?.moveToOTP(email: emailTextField.text ?? "")
    }
    override func touchesBegan(_ touches:Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
}
