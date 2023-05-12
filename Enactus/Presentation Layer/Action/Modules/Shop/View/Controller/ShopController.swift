import UIKit
import SnapKit

final class ShopController: UIViewController {
    
    //MARK: - Properties
    public var viewModel: ShopViewModelProtocol?
    
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
        view.separatorStyle = .none
        view.backgroundColor = .clear
        view.register(cellClass: ProductViewCell.self)
        return view
    }()
    
    //MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        
        fetchProducts()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setup()
    }
    //MARK: - Methods
    private func setup() {
        showAlert()
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
    
    private func showAlert() {
        self.viewModel?.showAlertView()
    }
}

extension ShopController {
    private func fetchProducts() {
        viewModel?.fetchProducts()
        viewModel?.updateViewData = {
            DispatchQueue.main.async {
                self.mainView.reloadData()
            }
        }
    }
}
