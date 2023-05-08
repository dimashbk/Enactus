import UIKit
import SnapKit

final class CreditController: UIViewController {
    
    //MARK: - Properties
    let sections: [Section] = [.init(section: .education, rows: [.overall]), .init(section: .credit, rows: [.disc])]
    
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
    
    //MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    //MARK: - View
    private func setup() {
        setupViews()
        makeConstraints()
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
}
