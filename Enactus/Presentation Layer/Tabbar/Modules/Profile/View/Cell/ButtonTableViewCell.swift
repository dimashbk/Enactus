//
//  ButtonTableViewCell.swift
//  Enactus
//
//  Created by Dinmukhamed on 28.04.2023.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    
    private lazy var infoView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.enFirstGradient.cgColor
        return view
    }()
    
    private lazy var myImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = .init(named: "Elipse")
        return imageView
    }()
    
    private lazy var label: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Mulish", size: 14)
        return label
    }()
    
    lazy var button: UIButton = {
       let button = UIButton()
        button.setImage(.init(named: "ic_next"), for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        contentView.backgroundColor = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        [infoView].forEach {
            contentView.addSubview($0)
        }
        [myImageView, label, button].forEach {
            infoView.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        infoView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.top.bottom.equalToSuperview().inset(2)
        }
        myImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.width.equalTo(32)
            make.left.equalToSuperview().inset(16)
        }
        label.snp.makeConstraints { make in
            make.left.equalTo(myImageView.snp.right).offset(12)
            make.centerY.equalToSuperview()
        }
        button.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.width.equalTo(24)
            make.right.equalToSuperview().inset(16)
        }
    }
    
    public func configure(with viewModel: ProfileButtonTableViewCellViewModel) {
        label.text = viewModel.cellName
    }

}
