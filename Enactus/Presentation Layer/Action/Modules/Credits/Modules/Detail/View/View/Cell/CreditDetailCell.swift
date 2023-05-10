import UIKit
import SnapKit

final class CreditDetailCell: UITableViewCell {
    
    //MARK: - View
    private lazy var iconImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "farmers")
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Mulish-Regular", size: 16)
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
    }
    
    private func setupViews() {
        [iconImageView, titleLabel, button].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func makeConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.leading.equalToSuperview().inset(12)
            make.height.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(22)
            make.leading.equalTo(iconImageView.snp.trailing).offset(16)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(14)
        }
    }
    
    private func setupLayer() {
        layer.cornerRadius = 18
        backgroundColor = UIColor.enPreWhite
    }
    
    public func configure(with viewModel: CreditDetailCellViewModelProtocol) {
        titleLabel.text = viewModel.title
    }
}
