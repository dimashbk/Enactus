import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    //MARK: - Properties
    public var mainViewModel: MainViewModelProtocol?
    public var coordinator: MainCoordinator?
    
    let actionSections: [Action] = [.init(section: .action, rows: [.remittance, .shop, .credits, .faq])]
    
    //MARK: - View
    private lazy var mainImageView = MainImageView()
    
    private lazy var actionsView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .enWhite
        view.delegate = self
        view.dataSource = self
        view.register(cellClass: ActionsViewCell.self)
        return view
    }()
    
    private lazy var reminderView = ReminderView()
    
    private lazy var organizationHeaderView = OrganizationHeaderView()
    
    private lazy var organizationsTableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(cellClass: OrganizationTableViewCell.self)
        return view
    }()
    
    private lazy var loaderView = ENCustomLoaderView()
    
    private lazy var showProfileAlert: UIAlertController = {
        
        let alertController = UIAlertController(title: "Профиль",
                                                message: "Для того чтобы переводить средства и оплачивать кредиты Вам необходимо заполнить Профиль",
                                                preferredStyle: .alert)
       //alert action
        let yesAction = UIAlertAction(title: "Перейти", style: .default) { (action) in
            self.tabBarController?.selectedIndex = 2
        }
        let noAction = UIAlertAction(title: "Отменить", style: .default) { (action) in

        }
       
       alertController.addAction(yesAction)
       alertController.addAction(noAction)

        return alertController
    }()
    
    init(viewModel: MainViewModelProtocol) {
        self.mainViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        fetchOrganizationList()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setup()
        showAlertForProfile()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainImageView.coinsFIrstLabel.text = "\(profileInfo.amount)"
    }
    
    func showAlertForProfile() {
        AuthorizationService.shared.checkProfile = {
            DispatchQueue.main.async {
                if profileInfo.name == "" && profileInfo.surname == "" {
                    self.present(self.showProfileAlert, animated: true)
                }
            }
        }
    }
    
    //MARK: - Methods
    private func setup() {
        setupViews()
        makeConstraints()
        configure()
        setupColors()
    }
    
    private func setupViews() {
        [mainImageView, actionsView, reminderView, organizationHeaderView, organizationsTableView, loaderView].forEach {
            view.addSubview($0)
        }
    }
    
    private func makeConstraints() {
        mainImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        actionsView.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(UIScreen.main.bounds.height / 7.8)
        }
        
        reminderView.snp.makeConstraints { make in
            make.top.equalTo(actionsView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(UIScreen.main.bounds.height / 8.9)
        }
        
        organizationHeaderView.snp.makeConstraints { make in
            make.top.equalTo(reminderView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(18)
        }
        
        organizationsTableView.snp.makeConstraints { make in
            make.top.equalTo(organizationHeaderView.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
        
        loaderView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(organizationsTableView)
            make.width.equalTo(UIScreen.main.bounds.width / 3.75)
            make.height.equalTo(UIScreen.main.bounds.height / 8.44)
        }
    }
    
    private func configure() {
        mainImageView.image = UIImage(named: "mainPageImage")
    }
    
    private func setupColors() {
        view.backgroundColor = .enWhite
        organizationsTableView.backgroundColor = .enWhite
    }
}

//MARK: - MainViewModel
extension MainViewController {
    func fetchOrganizationList() {
        loaderView.startAnimating()        
        mainViewModel?.fetchOrganizationsList()
        mainViewModel?.updateViewData = { [weak self] in
            DispatchQueue.main.async {
                self?.loaderView.stopAnimating()
                self?.organizationsTableView.reloadData()
            }
        }
    }
}
