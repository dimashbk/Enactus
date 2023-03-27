//
//  WelcomeCollectionViewCell.swift
//  Enactus
//
//  Created by Dinmukhamed on 15.03.2023.
//

import UIKit

class WelcomeCollectionViewCell: UICollectionViewCell {
    
    override class func description() -> String {
        return "WelcomeCollectionViewCell"
    }
    
    private lazy var imageView : UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .center
        view.image = UIImage(named: "backImage3")

        return view
    }()
    private lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать в StudC"
        label.font = UIFont(name: "Mulish-ExtraBold", size: 26)
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        
        return label
    }()
    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "Let's make student life easier with a new currency"
        label.font = UIFont(name: "Mulish-ExtraBold", size: 16)
        label.textAlignment = .left
        label.textColor = .enGray
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .enBlue
        button.layer.cornerRadius = 12

        
        return button
    }()
   lazy var logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Зарегистрироваться", for: .normal)
        button.setTitleColor(.enBlue, for: .normal)
        button.backgroundColor = .enDark
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.enBlue.cgColor
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup() {
        setupViews()
        makeConstraints()
    }
    
    func setupViews() {
        [imageView, firstLabel, secondLabel, logInButton, signInButton].forEach{
            self.addSubview($0)
        }
    }
    
    func makeConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        firstLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.trailing.equalToSuperview().inset(84)
            make.bottom.equalToSuperview().inset(304)
        }
        secondLabel.snp.makeConstraints { make in
            make.top.equalTo(firstLabel.snp.bottom).offset(16)
            make.leading.equalTo(24)
            make.trailing.equalToSuperview().inset(112)
        }
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(secondLabel.snp.bottom).offset(54)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(48)
        }
        logInButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(48)
        }
    }
    
}
