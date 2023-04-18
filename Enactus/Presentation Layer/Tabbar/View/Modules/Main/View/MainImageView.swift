import UIKit
import SnapKit

final class MainImageView: UIImageView {
    //MARK: - View
    private lazy var profileStackView: UIStackView = {
        let view = UIStackView()
        view.contentMode = .left
        return view
    }()
    
    private lazy var profileImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = view.frame.height / 2
        view.image = UIImage(named: "profileImage")
        return view
    }()
    
    private lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "Привет, Карина!"
        label.font = UIFont(name: "Mulish-Regular", size: 14)
        label.textColor = .white
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "У ВАС НА СЧЕТУ"
        label.font = UIFont(name: "Mulish-Regular", size: 12)
        label.textColor = .enTextGray
        return label
    }()
    
    private lazy var coinsFIrstLabel: UILabel = {
        let label = UILabel()
        label.text = "1 638 014"
        label.font = UIFont(name: "Mulish-Regular", size: 40)
        label.textColor = .white
        return label
    }()
    
    private lazy var coinsSecondLabel: UILabel = {
        let label = UILabel()
        label.text = ".15"
        label.font = UIFont(name: "Mulish-Regular", size: 22)
        label.textColor = .enTextGray
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "STUDCOINS"
        label.font = UIFont(name: "Mulish-Regular", size: 12)
        label.textColor = .enTextGray
        return label
    }()
    
    //MARK: - Init
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methdos
    private func setup() {
        setupViews()
        makeConstraints()
    }
    
    private func setupViews() {
        [profileStackView, titleLabel, coinsFIrstLabel, coinsSecondLabel, subtitleLabel].forEach {
            addSubview($0)
        }
        [profileImageView, greetingLabel].forEach {
            profileStackView.addSubview($0)
        }
    }
    
    private func makeConstraints() {
        profileStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(56)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(32)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.height.width.equalTo(32)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        greetingLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.leading.equalTo(profileImageView.snp.trailing).offset(8)
            make.bottom.equalToSuperview().inset(8)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(profileStackView.snp.bottom).offset(24)
            make.leading.equalToSuperview().inset(24)
        }
        
        coinsFIrstLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().inset(24)
        }
        
        coinsSecondLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(22)
            make.leading.equalTo(coinsFIrstLabel.snp.trailing)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(coinsFIrstLabel.snp.bottom).offset(2)
            make.leading.bottom.equalToSuperview().inset(24)
        }
    }
}
