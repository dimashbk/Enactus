import UIKit
import SnapKit

final class CustomAlertController: UIViewController {
    
    var alertTitle: String
    
    private lazy var alertView: CustomAlertView = {
        let view = CustomAlertView()
        view.configure(title: alertTitle)
        return view
    }()
    
    internal init(alertTitle: String) {
        self.alertTitle = alertTitle
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
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
