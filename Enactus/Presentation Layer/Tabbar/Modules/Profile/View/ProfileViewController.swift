import UIKit

final class ProfileViewController: UIViewController {
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 50
        imageView.backgroundColor = .black
        imageView.image = .init(named: "avatar")
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Амарова Карина"
        label.font = UIFont(name: "Mulish", size: 24)
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "27477@iitu.edu.kz"
        label.font = UIFont(name: "Mulish", size: 16)
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .enWhite
        tableView.dataSource = self
        tableView.delegate = self
        tableView.regiter(cellClass: InfoTableViewCell.self)
        tableView.regiter(cellClass: ButtonTableViewCell.self)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
        setupColors()
    }
    
    private func setupColors() {
        view.backgroundColor = .enWhite
    }
    
    private func setupSubviews() {
        [avatarImageView, nameLabel, emailLabel,
         tableView].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        avatarImageView.snp.makeConstraints { make in
            make.height.width.equalTo(100)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            return InfoTableViewCell()
        } else {
            return ButtonTableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 16
        } else {
            return 12
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "   "
    }
    
}

