import UIKit
import SnapKit

final class PaymentTextField: UITextField {
    
    //MARK: - View
    private lazy var paddingView = UIView()
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setup() {
        setupLayer()
        setupView()
        setupPaddingView()
        makeConstraints()
    }
    
    private func setupLayer() {
        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = UIColor.enWhite.cgColor
    }
    
    private func setupView() {
        backgroundColor = .enWhite
        textColor = .label
        attributedPlaceholder = NSAttributedString(string: "Сумма к оплате", attributes: [.foregroundColor: UIColor.gray])
        keyboardType = .default
        returnKeyType = .search
        autocorrectionType = .no
    }
    
    private func setupPaddingView() {
        leftView = paddingView
        leftViewMode = .always
    }
    
    private func makeConstraints() {
        paddingView.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.width.equalTo(35)
        }
    }
}
