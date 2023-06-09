import UIKit

final class DetailImageView: UIImageView {
    
    //MARK: - View
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Mulish-Bold", size: 16)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Mulish-Bold", size: 24)
        label.text = "1 638 014.15"
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
            make.top.equalToSuperview().offset(46)
            make.centerX.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
    }
    
    public func configure(with model: RetakeElement) {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = inputDateFormatter.date(from: model.expirationDate)

        guard let date = date else {return}
        
        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "dd.MM.yyyy"
        titleLabel.text = "до " + outputDateFormatter.string(from: date)
        subtitleLabel.text = "\(model.paymentAmount)"
    }
}
