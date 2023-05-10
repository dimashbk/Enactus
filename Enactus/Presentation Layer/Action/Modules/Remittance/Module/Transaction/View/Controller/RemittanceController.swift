import UIKit
import SnapKit

final class RemittanceController: UIViewController {
    
    //MARK: - Properties
    var coordinator: RemittanceCoordinator?
    
    var isEnable: Bool? {
        didSet {
            fixedButton.backgroundColor = isEnable ?? false ? .enBlue : .white
            fixedButton.setTitleColor(isEnable ?? false ? .white : .enBlue , for: .normal)
        }
    }
    
    //MARK: - View
    private lazy var firstView: PaymentView = {
        let view = PaymentView()
        view.titleLabel.text = "Тек.счет"
        view.subtitleLabel.text = "Накопленные бонусы"
        view.priceLabel.text = "1 638 014.15"
        return view
    }()
    
    private lazy var iconImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "ic_tran")
        return view
    }()
    
    private lazy var walletTextField: PaymentTextField = {
        let textField = PaymentTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Номер кошелька", attributes: [.foregroundColor: UIColor.gray])
        textField.delegate = self
        return textField
    }()
    
    private lazy var paymentTextField: PaymentTextField = {
        let textField = PaymentTextField()
        textField.delegate = self
        return textField
    }()
    
    private lazy var fixedButton: UIButton = {
        let button = UIButton()
        button.autoresizingMask = [.flexibleRightMargin, .flexibleBottomMargin]
        button.layer.cornerRadius = 12
        button.setTitle("Оплатить", for: .normal)
        button.setTitleColor(.enBlue, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.enBlue.cgColor
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 12)
        label.textColor = .enGray
        label.text = "Минимальная сумма перевода 500 С"
        return label
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    //MARK: - Methdos
    @objc
    private func buttonDidTap() {
        guard
            let text = paymentTextField.text,
            let intValue = Int(text),
            let walletId = walletTextField.text,
            isEnable == true
        else { return }

        coordinator?.showTransactionConfirmFlow(walletId: walletId, amount: intValue)
    }
    
    private func setup() {
        setupViews()
        makeConstraints()
    }
    
    private func setupViews() {
        [firstView, walletTextField, iconImageView, paymentTextField, fixedButton, textLabel].forEach {
            view.addSubview($0)
        }
    }

    private func makeConstraints() {
        firstView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(66)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(firstView.snp.bottom).inset(8)
            make.centerX.equalToSuperview()
        }
        
        walletTextField.snp.makeConstraints { make in
            make.top.equalTo(firstView.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(66)
        }
        
        paymentTextField.snp.makeConstraints { make in
            make.top.equalTo(walletTextField.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(66)
        }
        
        fixedButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(24)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(46)
            make.width.equalTo(327)
        }
        
        textLabel.snp.makeConstraints { make in
            make.bottom.equalTo(fixedButton.snp.top).inset(-24)
            make.centerX.equalToSuperview()
        }
    }
    
    public func setupButtonColor() {
        if walletTextField.text?.isEmpty == false, paymentTextField.text?.isEmpty == false {
            isEnable = true
        } else {
            isEnable = false
        }
    }
}
