import UIKit
import SnapKit

final class OrgsTitleViewCell: UITableViewCell {
    
    //MARK: - View
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .enTextDarkBlue
        label.font = UIFont(name: "Mulish-ExtraBold", size: 18)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .enTextDarkBlue
        label.font = UIFont(name: "Mulish-Regular", size: 16)
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .enTextDarkBlue
        label.font = UIFont(name: "Mulish-ExtraBold", size: 16)
        label.text = "Заработок: "
        return label
    }()
    
    private lazy var priceAmountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .enTextDarkBlue
        label.font = UIFont(name: "Mulish-Regular", size: 16)
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
        [titleLabel, subtitleLabel, priceLabel, priceAmountLabel].forEach {
            addSubview($0)
        }
    }
    
    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview()
            make.height.equalTo(24)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.leading.equalToSuperview()
            make.height.equalTo(40)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview()
            make.height.equalTo(20)
        }
        
        priceAmountLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.top)
            make.leading.equalTo(priceLabel.snp.trailing)
            make.height.equalTo(20)
        }
    }
    
    public func configure(with model: ENOrganizationModel) {
        titleLabel.text = model.title
        subtitleLabel.text = model.titleDesc
        priceAmountLabel.text = model.salaryAmount.addTenge()
    }
}
