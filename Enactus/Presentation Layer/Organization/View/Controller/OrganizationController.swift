import UIKit
import SnapKit

final class OrganizationController: UIViewController {
    
    //MARK: - View
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    private lazy var deadlineLabel: GradientLabel = {
        let label = GradientLabel()
        label.gradientColors = [UIColor.enFirstGradient.cgColor, UIColor.enSecondGradient.cgColor]
        label.layer.cornerRadius = 8
        label.text = "Осталось 5 дней"
        label.textColor = .white
        label.font = UIFont(name: "Mulish-Regular", size: 14)
        return label
    }()
    
    //MARK: - Init
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
        [imageView].forEach {
            view.addSubview($0)
        }
    }
    
    private func makeConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(26)
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(244)
        }
    }
}
