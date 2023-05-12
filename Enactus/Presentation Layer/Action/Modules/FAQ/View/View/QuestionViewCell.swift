import UIKit
import SnapKit

final class QuestionViewCell: UITableViewCell {
    
    //MARK: - View
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Mulish-Regular", size: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var button: UIButton = {
       let button = UIButton()
        button.setImage(.init(named: "ic_down"), for: .normal)
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
        [titleLabel, button].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(6)
            make.leading.equalToSuperview().offset(18)
            make.width.equalTo(260)
            make.height.equalTo(36)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().inset(14)
        }
    }
    
    private func setupLayer() {
        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
    }
    
    public func configure(with model: QuestionModel) {
        titleLabel.text = model.question
    }
}
