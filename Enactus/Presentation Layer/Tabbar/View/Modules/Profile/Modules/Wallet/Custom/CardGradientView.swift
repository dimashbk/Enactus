//
//  CardGradientView.swift
//  Enactus
//
//  Created by Dinmukhamed on 04.05.2023.
//

import UIKit

final class CardGradientView: UIView {
    //MARK: - View
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Mulish-Regular", size: 14)
        return label
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
        [titleLabel].forEach {
            addSubview($0)
        }
    }
    
    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
