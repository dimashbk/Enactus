import UIKit
import SnapKit

final class CreditController: UIViewController {
    
    //MARK: - Properties
    public var mainCoordinator: CreditCoordinator?
    
    var sections: [Section] = []
    
    var retakes: [RetakeElement] = []
    
    //MARK: - View
    private lazy var mainView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .clear
        view.separatorStyle = .none
        view.register(cellClass: CreditCell.self)
        view.register(aClass: CreditHeaderView.self)
        return view
    }()
    
    private lazy var emptyView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "good")
        view.isHidden = !sections.isEmpty
        return view
    }()
    
    private lazy var emptyTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "У вас нет действующих кредитов"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .enBlue
        label.isHidden = !sections.isEmpty
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override func loadView() {
        super.loadView()
        
        getRetakes()
    }
    
    //MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setup()
    }
    
    //MARK: - View
    private func setup() {
        setupViews()
        makeConstraints()
        setupNavbar()
    }
    
    private func setupViews() {
        [mainView, emptyView, emptyTitleLabel].forEach {
            view.addSubview($0)
        }
    }
    
    private func makeConstraints() {
        mainView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(500)
        }
        emptyView.snp.makeConstraints { make in
            make.bottom.equalTo(emptyTitleLabel.snp.top).offset(-18)
            make.centerX.equalToSuperview()
        }
        emptyTitleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(56)
        }
    }
    
    private func setupNavbar() {
        navigationItem.title = "Кредиты" 
    }
    
    private func getRetakes() {
        retakes = AuthorizationService.shared.retakes
        
        var rows: [CreditController.Section.Row] = []
        
        for _ in retakes {
            rows.append(.disc)
        }
        
        if !rows.isEmpty {
            sections.append(.init(section: .credit, rows: rows))
        }
    }
}
