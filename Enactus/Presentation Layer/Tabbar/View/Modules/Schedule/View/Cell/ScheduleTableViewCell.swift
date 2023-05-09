//
//  ScheduleTableViewCell.swift
//  Enactus
//
//  Created by Dinmukhamed on 09.05.2023.
//

import UIKit

final class ScheduleTableViewCell: UITableViewCell {
    
    private lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 68/255, green: 153/255, blue: 230/255, alpha: 0.2)
        return view
    }()
    
    private lazy var leftView: CardGradientView = {
        let view = CardGradientView()
        view.layer.cornerRadius = 4
        view.nameLabel.text = nil
        view.imageView.image = nil
        view.walletNumber.text = nil
        return view
    }()

    private lazy var lessonType: UILabel = {
        let label = UILabel()
        label.text = "Лекция"
        label.font = UIFont(name: "Mulish", size: 12)
        label.textColor = UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)
        return label
    }()
    
    private lazy var lessonName: UILabel = {
        let label = UILabel()
        label.text = "Веб-разработка"
        label.textColor = .black
        return label
    }()
    
    private lazy var lessonTime: UILabel = {
        let label = UILabel()
        label.text = "08:00-10:00"
        label.font = UIFont(name: "Mulish", size: 12)
        return label
    }()
    
    private lazy var myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .init(named: "Cone")
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        addSubview(view)
        view.addSubview(myImageView)
        view.layer.cornerRadius = 8
        [lessonType, lessonName, lessonTime, leftView].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        view.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(2)
            make.left.right.equalToSuperview()
        }
        myImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(22)
            make.right.equalToSuperview().inset(24)
        }
        lessonType.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.left.equalToSuperview().inset(24)
        }
        lessonName.snp.makeConstraints { make in
            make.top.equalTo(lessonType.snp.bottom).offset(4)
            make.left.equalToSuperview().inset(24)
        }
        lessonTime.snp.makeConstraints { make in
            make.top.equalTo(lessonName.snp.bottom).offset(4)
            make.left.equalToSuperview().inset(24)
        }
        leftView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.width.equalTo(8)
        }
    }
    
}
