import UIKit

final class FaqController: UIViewController {
    
    //MARK: - Properties
    var viewModel: QuestionViewModelProtocol?
    
    //MARK: - View
    private lazy var searchTextField: SearchTextField = {
        let textField = SearchTextField()
        textField.delegate = self
        return textField
    }()
    
    private lazy var mainView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(cellClass: QuestionViewCell.self)
        view.separatorStyle = .none
        return view
    }()
    
    
    //MARK: - LyfeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        view.backgroundColor = .white
    }
    
    //MARK: - Methods
    private func setup() {
        setupViews()
        makeConstraints()
    }

    private func setupViews() {
        [searchTextField, mainView].forEach {
            view.addSubview($0)
        }
    }
    
    private func makeConstraints() {
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        mainView.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
    }
}
