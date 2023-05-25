import UIKit
import SnapKit

final class CustomAlertController: UIViewController {
    
    var alertTitle: String
    var alertIconString: String
    
    private lazy var alertView: CustomAlertView = {
        let view = CustomAlertView()
        view.configure(title: alertTitle, imageString: alertIconString)
        return view
    }()
    
    internal init(alertTitle: String, alertIconString: String = "alert") {
        self.alertTitle = alertTitle
        self.alertIconString = alertIconString
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .none
        setup()
    }
    
    private func setup() {
        setupViews()
        makeConsstraints()
    }

    private func setupViews() {
        [alertView].forEach {
            view.addSubview($0)
        }
    }
    
    private func makeConsstraints() {
        alertView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(158)
            make.width.equalTo(241)
        }
    }
}
