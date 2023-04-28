import UIKit
import SnapKit

class ReminderView: UIView {
    
    //MARK: - View
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "У вас через 10 минут урок"
        label.textColor = .white
        label.font = UIFont(name: "Mulish-Bold", size: 17)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Веб-разработка/307к"
        label.textColor = .white
        label.font = UIFont(name: "Mulish-Regular", size: 14)
        return label
    }()
    
    private lazy var coneImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Cone")
        view.contentMode = .center
        return view
    }()
    
    private lazy var starImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Star")
        view.contentMode = .center
        return view
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
    override class var layerClass: Swift.AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        guard let layer = layer as? CAGradientLayer else { return }
        
        layer.colors = [UIColor.enFirstGradient.cgColor, UIColor.enSecondGradient.cgColor]
        layer.opacity = 0.8
        layer.startPoint = CGPoint(x: 0.0, y: 0.5)
        layer.endPoint = CGPoint(x: 1.0, y: 0.5)
        layer.cornerRadius = 8
    }
    
    private func setup() {
        setupViews()
        makeConstraints()
    }
    
    private func setupViews() {
        [titleLabel, subtitleLabel, coneImageView, starImageView].forEach {
            addSubview($0)
        }
    }
    
    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(26)
            make.leading.equalToSuperview().inset(16)
            make.bottom.equalTo(subtitleLabel.snp.top).inset(3)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(26)
        }
        
        coneImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().inset(6)
        }
        
        starImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.leading.equalTo(titleLabel.snp.trailing).offset(8)
        }
    }
}
