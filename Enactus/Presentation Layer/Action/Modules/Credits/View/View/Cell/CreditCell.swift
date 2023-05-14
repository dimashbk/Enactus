import UIKit
import SnapKit

final class CreditCell: UITableViewCell {
    
    //MARK: - View
    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .enPreWhite
        view.layer.cornerRadius = 18
        return view
    }()
    
    private lazy var iconImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        view.layer.masksToBounds = true
        view.image = UIImage(named: "farmers")
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Mulish-Bold", size: 16)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Mulish-Regular", size: 12)
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Mulish-Bold", size: 14)
        return label
    }()
    
    private lazy var button: UIButton = {
       let button = UIButton()
        button.setImage(.init(named: "ic_next"), for: .normal)
        return button
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
        contentView.backgroundColor = .white
        
    }
    
    private func setupViews() {
        [mainView].forEach {
            contentView.addSubview($0)
        }
        
        [iconImageView, titleLabel, subtitleLabel, priceLabel, button].forEach {
            mainView.addSubview($0)
        }
    }
    
    private func makeConstraints() {
        mainView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(4)
            make.leading.trailing.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(12)
            make.height.equalTo(55)
            make.width.equalTo(55)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalTo(iconImageView.snp.trailing).offset(20)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.equalTo(iconImageView.snp.trailing).offset(20)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(34)
            make.trailing.equalToSuperview().inset(40)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().inset(14)
        }
    }
    
    private func setupLayer() {
        
    }
    
    public func configure(with viewModel: CreditCellViewModelProtocol) {
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        priceLabel.text = viewModel.price
    }
}
