import UIKit
import SnapKit

final class OrgsImageViewCell: UITableViewCell {
    
    //MARK: - View
    private lazy var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 12
        imageView.backgroundColor = .enDarkestBlue
        return imageView
    }()
    
    private lazy var deadlineLabel: OrgsGradientView = {
        let label = OrgsGradientView()
        label.titleLabel.text = "Осталось 5 дней"
        label.titleLabel.textAlignment = .center
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
        [mainImageView, deadlineLabel].forEach {
            addSubview($0)
        }
    }
    
    private func makeConstraints() {
        mainImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height/3.46)
        }
        
        deadlineLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.top).offset(6)
            make.trailing.equalTo(mainImageView.snp.trailing).inset(12)
            make.height.equalTo(32)
            make.width.equalTo(UIScreen.main.bounds.width/2.5)
        }
    }
    
    private func setupColors() {
        backgroundColor = .white
    }
    
    public func configure(with model: ENOrganizationModel) {
        mainImageView.load(from: model.photo)
    }
}
