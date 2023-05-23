import UIKit
import SnapKit

final class ProductViewCell: UITableViewCell {
    
    //MARK: - View
    private lazy var productImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .enTextDarkBlue
        label.font = UIFont(name: "Mulish-Regular", size: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var starImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "stars")
        return view
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .enTextDarkBlue.withAlphaComponent(0.5)
        label.font = UIFont(name: "Mulish-Regular", size: 10)
        label.text = "(456)"
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .enTextDarkBlue
        label.font = UIFont(name: "Mulish-Regular", size: 14)
        label.text = "1 000 C"
        return label
    }()
    
    private lazy var secondPriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .enTextDarkBlue.withAlphaComponent(0.5)
        label.font = UIFont(name: "Mulish-Regular", size: 12)
        label.attributedText = "1500 C".addStrike()
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
        setupLayer()
    }
    
    private func setupViews() {
        [productImageView, titleLabel, starImageView, subtitleLabel, priceLabel, secondPriceLabel].forEach {
            addSubview($0)
        }
    }
    
    private func makeConstraints() {
        productImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(71)
            make.width.equalTo(95)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalTo(productImageView.snp.trailing).offset(16)
            make.width.equalTo(116)
            make.height.equalTo(40)
        }
        
        starImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(productImageView.snp.trailing).offset(16)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalTo(starImageView.snp.trailing).offset(4)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(34)
            make.trailing.equalToSuperview().inset(14)
        }
        
        secondPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(2)
            make.trailing.equalToSuperview().inset(14)
        }
    }
    
    private func setupLayer() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.enGray.withAlphaComponent(0.5).cgColor
        layer.cornerRadius = 12
    }
    
    public func configure(with model: ENProductModel) {
        titleLabel.text = model.title
        productImageView.downloaded(from: model.photo)
    }
}
