//
//  PaymentTableViewCell.swift
//  Enactus
//
//  Created by Dinmukhamed on 04.05.2023.
//

import UIKit

final class PaymentTableViewCell: UITableViewCell {
    
    private lazy var paymentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .init(named: "Logistics")
        return imageView
    }()
    
    private lazy var logisticsLabel: UILabel = {
        let label = UILabel()
        label.text = "Перевод"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var walletAddressLabel: UILabel = {
        let label = UILabel()
        label.text = profileInfo.walletAddress
        label.font = UIFont.systemFont(ofSize: 8)
        label.textColor = .enGray
        return label
    }()
    
    private lazy var sumLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .enGray
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        backgroundColor = UIColor(red: 102/255, green: 176/255, blue: 220/255, alpha: 0.025)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        [paymentImageView, sumLabel, dateLabel,
         walletAddressLabel, logisticsLabel].forEach {
            addSubview($0)
        }
    }
    
    private func setupConstraints() {
        paymentImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.left.equalToSuperview().inset(16)
        }
        logisticsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.left.equalTo(paymentImageView.snp.right).offset(10)
        }
        walletAddressLabel.snp.makeConstraints { make in
            make.top.equalTo(logisticsLabel.snp.bottom).offset(5)
            make.left.equalTo(paymentImageView.snp.right).offset(10)
        }
        sumLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(16)
        }
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(sumLabel.snp.bottom).offset(5)
            make.right.equalToSuperview().inset(16)
        }
    }
    
    public func configure(with model: TransactionModel) {
        if model.fromUser == profileInfo.id {
            sumLabel.text = "-\(model.amount)".addCredit()
        }else if model.toUser == profileInfo.id {
            sumLabel.text = "\(model.amount)".addCredit()
        }
        
        configureDateText(dateText: model.createdAt)
    }
    
    private func configureDateText(dateText: String) {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        let date = inputDateFormatter.date(from: dateText)

        guard let date = date else {return}
        
        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "dd.MM.yyyy"
        dateLabel.text = outputDateFormatter.string(from: date)
    }

}
