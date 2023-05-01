//
//  EditCellView.swift
//  Enactus
//
//  Created by Dinmukhamed on 30.04.2023.
//

import UIKit

final class EditCellView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Mulish", size: 14)
        return label
    }()
    
   lazy var textField: UITextField = {
       let textField = UITextField()
       textField.textAlignment = .right
       textField.font = UIFont(name: "Mulish", size: 14)
       return textField
    }()
    
    private func setup() {
        setupSubviews()
        setupConstraints()
        setupLayer()
    }
    
    private func setupLayer() {
        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = UIColor.enFirstGradient.cgColor
    }
    
    private func setupSubviews() {
        [label,textField].forEach {
            self.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        label.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        textField.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(16)
            make.width.equalTo(80)
            make.centerY.equalToSuperview()
        }
        self.snp.makeConstraints { make in
            make.height.equalTo(52)
        }
    }

}
