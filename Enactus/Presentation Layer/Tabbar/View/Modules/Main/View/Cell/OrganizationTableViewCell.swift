import UIKit
import SnapKit

final class OrganizationTableViewCell: UITableViewCell {
    
    //MARK: - View
    private lazy var orgImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.layer.cornerRadius = 45
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 16)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 12)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 16)
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 12)
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
        layer.cornerRadius = 8
        
        setupViews()
        makeConstraints()
        setupColors()
    }
    
    private func setupViews() {
        [orgImageView, titleLabel, subtitleLabel, priceLabel,  dateLabel].forEach {
            addSubview($0)
        }
    }
    
    private func makeConstraints() {
        orgImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().inset(16)
            make.height.width.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalTo(orgImageView.snp.trailing).offset(8)
            make.height.equalTo(19)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.bottom.equalToSuperview().inset(16)
            make.leading.equalTo(titleLabel.snp.leading)
            make.trailing.equalToSuperview().inset(104)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().inset(18)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(4)
            make.trailing.equalTo(priceLabel.snp.trailing)
            make.bottom.equalToSuperview().inset(30)
        }
    }
    
    private func setupColors() {
        backgroundColor = .white
        titleLabel.textColor = .black
        subtitleLabel.textColor = .enSubtitle
        priceLabel.textColor = .enTitle
        dateLabel.textColor = .enSubtitle
    }
    
    public func configure(with model: ENOrganizationModel) {
        titleLabel.text = model.title
        orgImageView.image = UIImage(named: "ITTigers")
        subtitleLabel.text = model.titleDesc
        priceLabel.text = model.salaryAmount.addTenge()
        dateLabel.text = "до 12.01.2023"
    }
}
