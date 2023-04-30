import UIKit
import SnapKit

final class OrganizationController: UIViewController {
    
    public weak var coordinator: BaseCoordinator?
    
    //MARK: - View
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    private lazy var deadlineLabel: OrgsGradientView = {
        let label = OrgsGradientView()
        label.titleLabel.text = "Осталось 5 дней"
        label.titleLabel.textAlignment = .center
        return label
    }()
    
    private lazy var titleView = OrgsTitleView()
    
    private lazy var filterView: OrgsGradientView = {
        let label = OrgsGradientView()
        label.titleLabel.text = "Волонтеры"
        label.titleLabel.textAlignment = .center
        return label
    }()
    
    private lazy var secondFilterView: OrgsGradientView = {
        let label = OrgsGradientView()
        label.titleLabel.text = "Быстро"
        label.titleLabel.textAlignment = .center
        return label
    }()
    
    private lazy var locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "location")
        return imageView
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.text = "dsjlk 123"
        label.textColor = .enTextDarkBlue
        label.font = UIFont(name: "Mulish-Medium", size: 12)
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .enGray.withAlphaComponent(0.3)
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = true
        view.backgroundColor = .green
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .enTextDarkBlue
        label.font = UIFont(name: "Mulish-ExtraBold", size: 18)
        label.text = "fadsklnfklasdf"
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .enTextDarkBlue
        label.font = UIFont(name: "Mulish-Regular", size: 16)
        label.text = ""
        label.sizeToFit()
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()
    
    private lazy var fixedButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 30, y: 700, width: 327, height: 46)
        button.layer.zPosition = .init(999)
        button.autoresizingMask = [.flexibleRightMargin, .flexibleBottomMargin]
        button.backgroundColor = .enBlue
        button.layer.cornerRadius = 12
        button.setTitle("Подать заявку", for: .normal)
        return button
    }()
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setup()
    }
    
    //MARK: - Methods
    private func setup() {
        setupViews()
        makeConstraints()
    }
    
    private func setupViews() {
        [imageView, deadlineLabel, titleView, filterView, secondFilterView, locationImageView, locationLabel, separatorView, scrollView,  fixedButton, titleLabel, ].forEach {
            view.addSubview($0)
        }
        [subtitleLabel].forEach {
            scrollView.addSubview($0)
        }
    }
    
    private func makeConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(26)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(UIScreen.main.bounds.height/3.46)
        }
        
        deadlineLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.top).offset(6)
            make.trailing.equalTo(imageView.snp.trailing).inset(12)
            make.height.equalTo(32)
            make.width.equalTo(UIScreen.main.bounds.width/2.5)
        }
        
        titleView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(106)
        }
        
        filterView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(24)
            make.height.equalTo(32)
            make.width.equalTo(93)
        }
        
        secondFilterView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(16)
            make.leading.equalTo(filterView.snp.trailing).offset(4)
            make.height.equalTo(32)
            make.width.equalTo(75)
        }
        
        locationImageView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(16)
            make.trailing.equalTo(locationLabel.snp.leading).inset(-6)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(16)
            make.trailing.equalToSuperview().inset(24)
        }
        
        separatorView.snp.makeConstraints { make in
            make.top.equalTo(filterView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(23)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(1000)
        }
        scrollView.contentSize = subtitleLabel.frame.size
        subtitleLabel.backgroundColor = .blue
        scrollView.contentSize = subtitleLabel.intrinsicContentSize
        subtitleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
}
