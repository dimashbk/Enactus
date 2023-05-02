import UIKit
import SnapKit

final class OrgsLocationViewCell: UITableViewCell {
    
    //MARK: - View
    private lazy var filterView: OrgsGradientView = {
        let label = OrgsGradientView()
        label.titleLabel.text = "Волонтеры"
        label.titleLabel.textAlignment = .center
        return label
    }()
    
    private lazy var secondFilterView: OrgsGradientView = {
        let label = OrgsGradientView()
        label.titleLabel.text = "Быстро"
        label.titleLabel.textAlignment = .center
        return label
    }()
    
    private lazy var locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "location")
        return imageView
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .enTextDarkBlue
        label.font = UIFont(name: "Mulish-Medium", size: 12)
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .enGray.withAlphaComponent(0.3)
        return view
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
        [filterView, secondFilterView, locationImageView, locationLabel, separatorView].forEach {
            addSubview($0)
        }
    }
    
    private func makeConstraints() {
        filterView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview()
            make.height.equalTo(32)
            make.width.equalTo(93)
        }
        
        secondFilterView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalTo(filterView.snp.trailing).offset(4)
            make.height.equalTo(32)
            make.width.equalTo(75)
        }
        
        locationImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.trailing.equalTo(locationLabel.snp.leading).inset(-6)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(24)
        }
        
        separatorView.snp.makeConstraints { make in
            make.top.equalTo(filterView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(2)
        }
    }
    
    private func setupColors() {
        backgroundColor = .white
        
    }
    
    public func configure(with model: ENOrganizationModel) {
        locationLabel.text = model.location
    }
}
