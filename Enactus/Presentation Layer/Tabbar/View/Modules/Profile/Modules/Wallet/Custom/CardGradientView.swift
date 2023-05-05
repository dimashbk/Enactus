//
//  CardGradientView.swift
//  Enactus
//
//  Created by Dinmukhamed on 04.05.2023.
//

import UIKit

final class CardGradientView: UIView {
    //MARK: - View
    public lazy var walletNumber: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = profileInfo.walletAddress
        label.font = UIFont(name: "Mulish-Regular", size: 12)
        return label
    }()
    public lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = profileInfo.name + " " + profileInfo.surname
        label.font = UIFont(name: "Mulish-Regular", size: 16)
        return label
    }()
    
    private lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = .init(named: "AppIcon")
        imageView.layer.cornerRadius = 26
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    override class var layerClass: Swift.AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        guard let layer = layer as? CAGradientLayer else { return }
        
        layer.colors = [UIColor.enFirstGradient.cgColor, UIColor.enSecondGradient.cgColor]
        layer.startPoint = CGPoint(x: 0.0, y: 0.5)
        layer.endPoint = CGPoint(x: 1.0, y: 0.5)
        layer.cornerRadius = 20
    }
    
    private func setup() {
        setupViews()
        makeConstraints()
    }
    
    private func setupViews() {
        [walletNumber, nameLabel, imageView].forEach {
            addSubview($0)
        }
    }
    
    private func makeConstraints() {
        walletNumber.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(150)
            make.left.right.equalToSuperview().inset(24)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(walletNumber.snp.bottom).offset(8)
            make.left.equalToSuperview().inset(24)
        }
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(24)
            make.right.equalToSuperview().inset(24)
            make.height.width.equalTo(52)
        }
        
    }
}
