import UIKit
import SnapKit

final class CreditDetailController: UIViewController {
    
    //MARK: - Properties
    var coordinator: CreditDetailCoordinator?
    
    let sections: [Section] = [.init(section: .payment, rows: []), .init(section: .calendar, rows: [])]
    
    //MARK: - View
    private lazy var detaiImageView: DetailImageView = {
        let view = DetailImageView()
        view.image = UIImage(named: "mainPageImage")
        view.layer.cornerRadius = 18
        view.contentMode = .scaleToFill
        return view
    }()
    
    private lazy var mainView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        view.separatorStyle = .none
        view.register(cellClass: CreditDetailCell.self)
        return view
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 12)
        label.textColor = .enGray
        label.text = "Стоимость 1 кредита составляет 500C"
        return label
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setup()
    }
    
    //MARK: - Methods
    private func setup() {
        setupViews()
        makeConstraints()
    }
    
    private func setupViews() {
        [detaiImageView, mainView, textLabel].forEach {
            view.addSubview($0)
        }
    }
    
    private func makeConstraints() {
        detaiImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(152)
        }
        
        mainView.snp.makeConstraints { make in
            make.top.equalTo(detaiImageView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(textLabel.snp.top).offset(16)
        }
        
        textLabel.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(32)
            make.centerX.equalToSuperview()
        }
    }
}
