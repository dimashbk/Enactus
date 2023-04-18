import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    //MARK: - Properties
    let actionSections: [Action] = [.init(section: .action, rows: [.remittance, .shop, .credits, .faq])]
    
    let mainViewModel = MainViewModel()
    
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
    
    //MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        fetchOrganizationList()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: - Methods
    private func setup() {
        setupViews()
        makeConstraints()
        configure()
        setupColors()
    }
    
    private func setupViews() {
        [mainImageView, actionsView, reminderView].forEach {
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
    }
    
    private func configure() {
        mainImageView.image = UIImage(named: "mainPageImage")
    }
    
    private func setupColors() {
        view.backgroundColor = .enWhite
    }
}

extension MainViewController {
    func fetchOrganizationList() {
        mainViewModel.fetchOrganizationsList()
    }
}
