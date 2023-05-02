import UIKit
import SnapKit

final class OrgsDescriptionViewCell: UITableViewCell {
    
    //MARK: - View
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .enTextDarkBlue
        label.text = "Подробнее об организации"
        label.font = UIFont(name: "Mulish-ExtraBold", size: 18)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .enTextDarkBlue
        label.font = UIFont(name: "Mulish-Regular", size: 16)
//        label.sizeToFit()
//        label.setContentHuggingPriority(.required, for: .vertical)
//        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()

    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(23)
        }
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    public func configure(with model: ENOrganizationModel) {
        subtitleLabel.text = model.description
    }
}
