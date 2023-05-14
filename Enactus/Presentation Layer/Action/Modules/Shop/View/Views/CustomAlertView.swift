import UIKit
import SnapKit

class CustomAlertView: UIView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Все эти товары Вы сможете приобрести в IITU магазине"
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Mulish-Regular", size: 16)
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "alert")
        return view
    }()

    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        setupLayer()
        setupViews()
        makeConstraints()
    }
    
    private func setupLayer() {
        backgroundColor = UIColor.enLightGray
        layer.cornerRadius = 10
    }
    
    private func setupViews() {
        [iconImageView, titleLabel].forEach {
            addSubview($0)
        }
    }
    
    private func makeConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(54)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(14)
            make.centerX.equalToSuperview()
            make.width.equalTo(207)
            make.height.equalTo(54)
        }
    }
}
