import UIKit
import SnapKit

final class CustomAlertController: UIViewController {
    
    private lazy var alertView = CustomAlertView()
    
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
