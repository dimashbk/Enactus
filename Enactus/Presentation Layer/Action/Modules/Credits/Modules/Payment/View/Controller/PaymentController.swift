import UIKit
import SnapKit

final class PaymentController: UIViewController {
    
    //MARK: - Properties
    var coordinator: PaymentCoordinator?
    
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
    
    private lazy var secondView: PaymentView = {
        let view = PaymentView()
        view.titleLabel.text = "За обучение"
        view.subtitleLabel.text = "до 11 апреля"
        view.priceLabel.text = "0.00"
        return view
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
        label.text = "Стоимость 1 кредита составляет 500C"
        return label
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setup()
    }
    
    //MARK: - Methdos
    @objc
    private func buttonDidTap() {
        guard
            let text = paymentTextField.text,
            let _ = Int(text),
            isEnable == true
        else { return }
        
        coordinator?.showConfirmFlow(text: text)
    }
    
    private func setup() {
        setupViews()
        makeConstraints()
    }
    
    private func setupViews() {
        [firstView,secondView, iconImageView, paymentTextField, fixedButton, textLabel].forEach {
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
        
        secondView.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).inset(4)
            make.leading.trailing.equalToSuperview().inset(14)
            make.height.equalTo(66)
        }
        
        paymentTextField.snp.makeConstraints { make in
            make.top.equalTo(secondView.snp.bottom).offset(12)
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
        isEnable = !(paymentTextField.text?.isEmpty ?? true)
    }
}
