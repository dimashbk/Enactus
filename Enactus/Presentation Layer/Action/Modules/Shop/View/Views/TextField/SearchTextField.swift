import UIKit
import SnapKit

final class SearchTextField: UITextField {
    
    //MARK: - View
    private lazy var searchIcon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
    
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
        setupSearchIconView()
        makeConstraints()
    }
    
    private func setupLayer() {
        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
    }
    
    private func setupView() {
        backgroundColor = .clear
        textColor = .label
        attributedPlaceholder = NSAttributedString(string: "Найти товар", attributes: [.foregroundColor: UIColor.gray])
        clearButtonMode = .whileEditing
        keyboardType = .default
        returnKeyType = .search
        autocorrectionType = .no
    }
    
    private func setupSearchIconView() {
        searchIcon.tintColor = .gray
        searchIcon.contentMode = .scaleAspectFit
        
        paddingView.addSubview(searchIcon)
        leftView = paddingView
        leftViewMode = .always
    }
    
    private func makeConstraints() {
        paddingView.addSubview(searchIcon)
        paddingView.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.width.equalTo(35)
        }
        searchIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(8)
            make.height.width.equalTo(20)
        }
    }
}
