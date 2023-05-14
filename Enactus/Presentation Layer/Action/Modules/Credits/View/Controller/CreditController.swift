import UIKit
import SnapKit

final class CreditController: UIViewController {
    
    //MARK: - Properties
    public var mainCoordinator: CreditCoordinator?
    
    let sections: [Section] = [.init(section: .education, rows: [.overall]), .init(section: .credit, rows: [.disc, .disc])]
    
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
        [mainView].forEach {
            view.addSubview($0)
        }
    }
    
    private func makeConstraints() {
        mainView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(500)
        }
    }
    
    private func setupNavbar() {
        navigationItem.title = "Кредиты" 
    }
    
    private func getRetakes() {
        retakes = AuthorizationService.shared.retakes
    }
}
