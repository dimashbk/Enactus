import UIKit
import SnapKit

final class ShopController: UIViewController {
    
    //MARK: - View
    private lazy var productSearchBar: SearchTextField = {
        let textField = SearchTextField()
        textField.delegate = self
        return textField
    }()
    
    private lazy var mainView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        view.separatorColor = .clear
        return view
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    //MARK: - Methods
    private func setup() {
        setupViews()
        makeConstraints()
    }
    
    private func setupViews() {
        [productSearchBar,mainView].forEach {
            view.addSubview($0)
        }
    }
    
    private func makeConstraints() {
        productSearchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        mainView.snp.makeConstraints { make in
            make.top.equalTo(productSearchBar.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
    }
}
