import UIKit
import SnapKit

final class PaymentView: UIView {
    
    //MARK: - View
    private lazy var iconImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "farmers")
        return view
    }()
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Mulish-Bold", size: 16)
        return label
    }()
    
    public lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Mulish-Regular", size: 12)
        return label
    }()
    
    public lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Mulish-Bold", size: 14)
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
        setupLayer()
    }
    
    private func setupViews() {
        [iconImageView, titleLabel, subtitleLabel, priceLabel].forEach {
            addSubview($0)
        }
    }
    
    private func makeConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().inset(12)
            make.height.equalTo(44)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.leading.equalTo(iconImageView.snp.trailing).offset(12)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.equalTo(iconImageView.snp.trailing).offset(12)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func setupLayer() {
        layer.cornerRadius = 18
        backgroundColor = UIColor.enPreWhite
    }
}
