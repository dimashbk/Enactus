import UIKit
import SnapKit

class ActionsViewCell: UICollectionViewCell {
    
    //MARK: - View
    private lazy var iconImageVIew: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 30
        view.layer.masksToBounds = true
        view.contentMode = .center
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        //TODO - добавить шрифт SF Pro Display
        label.font = UIFont(name: "Arial", size: 14)
        return label
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 8
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methdos
    private func setup() {
        setupViews()
        makeConstraints()
        setupColors()
    }
    
    private func setupViews() {
        [iconImageVIew, titleLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func makeConstraints() {
        iconImageVIew.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(8)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageVIew.snp.bottom).offset(8)
            make.bottom.equalToSuperview().inset(12)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupColors() {
        backgroundColor = .white
        titleLabel.textColor = .enTextDarkBlue
        iconImageVIew.backgroundColor = .enBlue.withAlphaComponent(0.2)
    }
    
    public func configure(with viewModel: ActionsViewCellViewModelProtocol) {
        iconImageVIew.image = UIImage(named: viewModel.iconName)
        titleLabel.text = viewModel.titleText
    }
}
