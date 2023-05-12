import UIKit
import SnapKit

final class ENSuccessController: UIViewController {

    //MARK: - Properties
    var viewModel: ENSuccessViewModelProtocol?
    
    //MARK: - View
    private lazy var iconImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "success")
        view.contentMode = .scaleToFill
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = viewModel?.title
        label.font = UIFont(name: "Mulish-Bold", size: 22)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = viewModel?.subtitle
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Mulish-Regular", size: 16)
        return label
    }()
    
    private lazy var fixedButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .enBlue
        button.layer.cornerRadius = 8
        button.setTitle("Вернуться на главную", for: .normal)
        button.addTarget(self, action: #selector(onBackButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        view.backgroundColor = .black
    }
    
    //MARK: - Methods
    private func setup() {
        setupViews()
        makeConstraints()
    }
    
    private func setupViews() {
        [iconImageView, titleLabel, subtitleLabel, fixedButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func makeConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.bottom.equalTo(titleLabel.snp.top).inset(-32)
            make.height.width.equalTo(UIScreen.main.bounds.height/6)
            make.leading.trailing.equalToSuperview().inset(UIScreen.main.bounds.width/3.23)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(UIScreen.main.bounds.width/7.35)
            make.width.equalTo(UIScreen.main.bounds.width/1.37)
        }
        
        fixedButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(UIScreen.main.bounds.height/9.3)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(UIScreen.main.bounds.height/17.6)
            make.width.equalTo(UIScreen.main.bounds.width/1.14)
        }
    }
    
    @objc
    private func onBackButtonDidTap() {
        viewModel?.onBackButtonDidTap?()
    }
}
