//
//  InfoTableViewCell.swift
//  Enactus
//
//  Created by Dinmukhamed on 28.04.2023.
//

import UIKit

final class InfoTableViewCell: UITableViewCell {
    
    var viewModel: ProfileInfoTableViewCellViewModel?
    
    private lazy var infoView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.enFirstGradient.cgColor
        return view
    }()

    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Дата рождения"
        label.font = UIFont(name: "Mulish", size: 14)
        return label
    }()
    
    private lazy var dateInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "28.09.2022"
        label.font = UIFont(name: "Mulish", size: 14)
        label.textColor =  UIColor(red: 0.251, green: 0.169, blue: 0.104, alpha: 1)
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        contentView.backgroundColor = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
        
    }
    private func setupSubviews() {
        [infoView].forEach {
            contentView.addSubview($0)
        }
        [dateLabel, dateInfoLabel].forEach {
            infoView.addSubview($0)
        }
    }
    private func setupConstraints() {
        infoView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.top.bottom.equalToSuperview().inset(2)
        }
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(16)
        }
        dateInfoLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(16)
        }
    }
    
    public func configure(with viewModel: ProfileInfoTableViewCellViewModel) {
        dateLabel.text = viewModel.cellName
        dateInfoLabel.text = viewModel.cellInfo
    }

}
