//
//  ViewController.swift
//  Enactus
//
//  Created by Dinmukhamed on 19.04.2023.
//

import UIKit

final class CreatePasswordViewController: UIViewController {
    
    var coordinator: CreatePasswordCoordinator?
    
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
        label.text = "Придумайте пароль"
        label.font = UIFont(name: "Mulish", size: 32)
        label.textColor = .white
        return label
    }()
    
    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароль должен состоять минимум из 8 символов"
        label.font = UIFont(name: "Mulish", size: 16)
        label.numberOfLines = 0
        label.textColor = .enHalfGray
        return label
    }()

    private lazy var firstTextField: AuthorizationTextField = {
        let textField = AuthorizationTextField(placeholder: "Введите пароль")
        return textField
    }()
    
    private lazy var secondTextField: AuthorizationTextField = {
        let textField = AuthorizationTextField(placeholder: "Повторите пароль")
        return textField
    }()
    
    private lazy var errorLabel: GradientLabel = {
        let label = GradientLabel()
        label.text = "Пароли не совпадают"
        label.font = UIFont(name: "Mulish-Regular", size: 12)
        label.isHidden = false
        label.gradientColors = [UIColor.enFirstGradient.cgColor, UIColor.enSecondGradient.cgColor]
        return label
    }()
    
    private lazy var changePasswordButton: TwoStateButton = {
        let button = TwoStateButton()
        button.changeState(state: .disabled)
        button.setTitle("Изменить пароль", for: .normal)
        button.addTarget(self, action: #selector(changeState), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        [backgroundImage, firstLabel, secondLabel,
         firstTextField, secondTextField, errorLabel,
         logoImage, changePasswordButton].forEach {
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
        firstTextField.snp.makeConstraints { make in
            make.top.equalTo(secondLabel.snp.bottom).offset(32)
            make.height.equalTo(36)
            make.left.right.equalToSuperview().offset(24)
        }
        secondTextField.snp.makeConstraints { make in
            make.top.equalTo(firstTextField.snp.bottom).offset(32)
            make.height.equalTo(36)
            make.left.right.equalToSuperview().offset(24)
        }
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(secondTextField.snp.bottom).offset(16)
            make.left.equalToSuperview().inset(24)
        }
        changePasswordButton.snp.makeConstraints { make in
            make.top.equalTo(secondTextField.snp.bottom).offset(view.bounds.width / 2 + 70)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(48)
        }
    }
    
    @objc func changeState(button: TwoStateButton) {
        button.changeState(state: .enabled)
    }

}
