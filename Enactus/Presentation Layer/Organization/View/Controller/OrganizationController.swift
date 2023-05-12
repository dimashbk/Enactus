import UIKit
import SnapKit

final class OrganizationController: UIViewController {
    
    public var orgsViewModel: OrgsViewModelProtocol?
    
    let sections: [Section] = [.init(section: .details, rows: [.image, .title, .location, .description])]
    
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
        button.addTarget(self, action: #selector(applytToPayment), for: .touchUpInside)
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
    
    private func setupNavbar() {
        navigationItem.title = orgsViewModel?.organizationModel.title
    }
    
    private func fetchDetailModel() {
        orgsViewModel?.fetchOrganizationDetails()
    }
    
    @objc
    private func applytToPayment() {
        orgsViewModel?.applyToPayment()
    }
}
