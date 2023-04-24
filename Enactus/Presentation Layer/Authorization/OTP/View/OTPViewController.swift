//
//  OTPViewController.swift
//  Enactus
//
//  Created by Dinmukhamed on 03.04.2023.
//

import UIKit

final class OTPViewController: UIViewController {
    
    var viewModel: OTPViewModel?
    
    var email = AuthorizationService.shared.authorizationModel.email
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите код из СМС, отправленный на почту \(email ?? "")"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Mulish-Medium", size: 16)
        return label
    }()
    
    private lazy var otpStackView: OTPStackView = {
        let stackView = OTPStackView()
        return stackView
    }()
    
    private lazy var sendButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отправить код", for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.enGray.cgColor
        button.titleLabel?.font = UIFont(name: "Mulish-Regular", size: 16)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(checkCorrectness), for: .touchUpInside)
        return button
    }()
    
    private lazy var alertLabel: GradientLabel = {
        let label = GradientLabel()
        label.text = "Введеный код неверен. Попробуйте еще раз."
        label.textAlignment = .center
        label.font = UIFont(name: "Mulish", size: 16)
        label.numberOfLines = 0
        label.isHidden = true
        label.gradientColors = [UIColor.enFirstGradient.cgColor, UIColor.enSecondGradient.cgColor]
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupViews()
        setupColors()
        setupConstraints()
    }
    
    private func setupViews() {
        [headerLabel,
        otpStackView,
        sendButton, alertLabel].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupColors() {
        view.backgroundColor = .enBlack
    }
    
    private func setupConstraints() {
        headerLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(44)
            make.top.equalToSuperview().inset(view.bounds.width / 2 - 60)
        }
        otpStackView.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        alertLabel.snp.makeConstraints { make in
            make.top.equalTo(otpStackView.snp.bottom).offset(32)
            make.left.right.equalToSuperview().inset(view.bounds.width / 4)
        }
        sendButton.snp.makeConstraints { make in
            make.top.equalTo(otpStackView.snp.bottom).offset(view.bounds.width / 2 - 25)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(48)
        }
        
    }

    @objc func checkCorrectness() {
        AuthorizationService.shared.authorizationModel.code = otpStackView.getOTP()
        AuthorizationService.shared.resetPassword()
    }
}
