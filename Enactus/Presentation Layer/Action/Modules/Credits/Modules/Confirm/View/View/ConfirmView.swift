import UIKit
import SnapKit

final class ConfirmView: UIView {
    
    //MARK: - View
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Mulish-Regular", size: 16)
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
        [titleLabel, priceLabel].forEach {
            addSubview($0)
        }
    }
    
    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(22)
            make.leading.equalToSuperview().inset(16)
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
