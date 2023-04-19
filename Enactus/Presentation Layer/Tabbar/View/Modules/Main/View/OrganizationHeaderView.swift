import UIKit
import SnapKit

final class OrganizationHeaderView: UIView {
    
    //MARK: - View
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Получить коины"
        //TODO добавить SF Pro Display в font
        label.font = UIFont(name: "Arial", size: 14)
        label.textColor = .enBlack
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "См.все"
        //TODO добавить SF Pro Display в font
        label.font = UIFont(name: "Arial", size: 14)
        label.textColor = .enWhiteBlue
        return label
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setup() {
        setupViews()
        makeConstraints()
    }
    
    private func setupViews() {
        [titleLabel, subtitleLabel].forEach {
            addSubview($0)
        }
    }
    
    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview()
        }
        subtitleLabel.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview()
        }
    }
}
