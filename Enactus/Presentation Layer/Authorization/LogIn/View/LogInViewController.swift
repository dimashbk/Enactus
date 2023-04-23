//
//  LogInViewController.swift
//  Enactus
//
//  Created by Dinmukhamed on 27.03.2023.
//

import UIKit

final class LogInViewController: UIViewController {

    //регистрация
    var viewModel: LoginViewModel?
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .init(named: "authorizathionBackground")
        return imageView
    }()
    private lazy var logoImageView: UIImageView = {
       let logoImageView = UIImageView()
        logoImageView.image = .init(named: "logoImage")
        return logoImageView
    }()
    
    private lazy var signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация"
        label.textColor = .white
        label.font = UIFont(name: "Mulish-Bold", size: 32)
        return label
    }()
    
    private lazy var orLabel: UILabel = {
        let orLabel = UILabel()
        orLabel.text = "или"
        orLabel.textColor = .enHalfGray
        orLabel.font = UIFont(name: "Mulish-Regular", size: 16)
        return orLabel
    }()
    
    private lazy var emailTextField: AuthorizationTextField = {
        let textField = AuthorizationTextField(placeholder: "ID")
        textField.eyeButton.isHidden = true
        return textField
    }()
    
    private lazy var passwordTextField: AuthorizationTextField = {
        let textField = AuthorizationTextField(placeholder: "Логин")
        textField.eyeButton.isHidden = true
        return textField
    }()
    

    private lazy var forgetPassword: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "forgetImageText"), for: .normal)
        button.isHidden = true
        return button
    }()
    
    private lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.text = "Неверный пароль"
        label.textColor = .enYellow
        label.font = UIFont(name: "Mulish-Regular", size: 14)
        label.isHidden = true
        return label
    }()
    
    private lazy var signInButton: UIButton = {
        let signInButton = UIButton()
        signInButton.setTitle("Регистрация", for: .normal)
        signInButton.backgroundColor = .enBlue
        signInButton.titleLabel?.font = UIFont(name: "Mulish-Regular", size: 16)
        signInButton.layer.cornerRadius = 8
        signInButton.addTarget(self, action: #selector(showOtp), for: .touchUpInside)
        return signInButton
    }()
    
    private lazy var registerButton: UIButton = {
        let registerInButton = UIButton()
        registerInButton.setTitle("Войти", for: .normal)
        registerInButton.backgroundColor = .none
        registerInButton.layer.borderWidth = 1
        registerInButton.layer.borderColor = UIColor.enGray.cgColor
        registerInButton.titleLabel?.font = UIFont(name: "Mulish-Regular", size: 16)
        registerInButton.layer.cornerRadius = 8
        registerInButton.addTarget(self, action: #selector(showSignin), for: .touchUpInside)
        return registerInButton
    }()
    
    private lazy var firstLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = .enHalfGray
        return lineView
    }()
    private lazy var secondLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = .enHalfGray
        return lineView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setup()
    }
    
    private func setup(){
        setupViews()
        makeConstraints()
    }
    
    private func setupViews() {
        [backgroundImageView, signInLabel, emailTextField,
         passwordTextField, forgetPassword, errorLabel,
         logoImageView, signInButton, registerButton,
         firstLineView, secondLineView, orLabel].forEach {
            view.addSubview($0)
        }
    }
    
    private func makeConstraints() {
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(68)
            make.left.equalToSuperview().inset(24)
        }
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        signInLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(view.bounds.width / 2)
            make.left.equalToSuperview().inset(24)
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(signInLabel.snp.bottom).offset(24)
            make.height.equalTo(36)
            make.left.right.equalToSuperview().offset(24)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(32)
            make.height.equalTo(36)
            make.left.right.equalToSuperview().offset(24)
        }
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(16)
            make.left.equalToSuperview().inset(24)
        }
        forgetPassword.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(16)
            make.right.equalToSuperview().inset(24)
        }
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(forgetPassword.snp.bottom).offset(32)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(48)
        }
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(view.frame.width / 2 + 20)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(48)
        }
        firstLineView.snp.makeConstraints { make in
            make.bottom.equalTo(registerButton.snp.bottom).inset(view.bounds.width / 4 - 10)
            make.left.equalToSuperview().inset(24)
            make.right.equalTo(orLabel.snp.right).inset(40)
            make.height.equalTo(1)
        }
        secondLineView.snp.makeConstraints { make in
            make.bottom.equalTo(registerButton.snp.bottom).inset(view.bounds.width / 4 - 10)
            make.right.equalToSuperview().inset(24)
            make.left.equalTo(orLabel.snp.left).inset(40)
            make.height.equalTo(1)
        }

        orLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(registerButton.snp.bottom).inset(view.bounds.width / 4 + 2)
        }
    }
    
    @objc func showOtp() {
        viewModel?.moveToOTP()
    }
    @objc func showSignin() {
        viewModel?.moveToSignIn()
    }
}
