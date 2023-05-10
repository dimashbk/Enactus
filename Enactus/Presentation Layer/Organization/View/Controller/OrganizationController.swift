import UIKit
import SnapKit

final class OrganizationController: UIViewController {
    
    public weak var coordinator: BaseCoordinator?
    public var orgsViewModel: OrgsViewModelProtocol?
    
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
    let sections: [Section] = [.init(section: .details, rows: [.image, .title, .location, .description])]
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = true
        view.backgroundColor = .green
    //MARK: - View
    private lazy var orgsView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.separatorColor = .clear
        view.allowsSelection = false
        view.showsVerticalScrollIndicator = false
        return view
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
    
    //MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        fetchDetailModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setup()
    }
    
    //MARK: - Init
    init(viewModel: OrgsViewModelProtocol) {
        self.orgsViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setup() {
        setupViews()
        makeConstraints()
        setupCells()
        setupNavbar()
    }
    
    private func setupViews() {
        [orgsView, fixedButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func makeConstraints() {
        orgsView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(26)
            make.leading.trailing.equalToSuperview().inset(24)
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupCells() {
        [
            OrgsImageViewCell.self,
            OrgsTitleViewCell.self,
            OrgsLocationViewCell.self,
            OrgsDescriptionViewCell.self
        ].forEach {
            orgsView.register(cellClass: $0)
        }
    }
    
    private func fetchDetailModel() {
        orgsViewModel?.fetchOrganizationDetails()
    }
    
    private func setupNavbar() {
        navigationItem.title = orgsViewModel?.organizationModel.title
    }
}
