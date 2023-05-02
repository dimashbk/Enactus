//
//  EditProfileViewController.swift
//  Enactus
//
//  Created by Dinmukhamed on 30.04.2023.
//

import UIKit

final class EditProfileViewController: UIViewController {
    
    var viewModel: EditProfileViewModel?
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .init(named: "profileBackground")
        return imageView
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 50
        imageView.backgroundColor = .black
        imageView.image = .init(named: "avatar")
        return imageView
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.text = (profileInfo.name ?? "") + " " + (profileInfo.surname ?? "")
        textField.font = UIFont(name: "Mulish", size: 24)
        textField.textAlignment = .center
        return textField
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = AuthorizationService.shared.authorizationModel.email
        label.font = UIFont(name: "Mulish", size: 16)
        return label
    }()
    
    private lazy var dateOfBirth: EditCellView = {
        let editCell = EditCellView()
        editCell.label.text = "Дата рождения"
        editCell.textField.text = profileInfo.birthday
        return editCell
    }()
    
    private lazy var groupId: EditCellView = {
        let editCell = EditCellView()
        editCell.label.text = "Группа"
        editCell.textField.text = profileInfo.group
        return editCell
    }()
    
    private lazy var id: EditCellView = {
        let editCell = EditCellView()
        editCell.label.text = "ID"
        return editCell
    }()
    

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
        setupColors()
        setupNavController()
    }
    
    private func setupColors() {
        view.backgroundColor = .enWhite
    }
    
    private func setupSubviews() {
        [backgroundImage, avatarImageView, emailLabel,
         nameTextField, dateOfBirth, groupId, id].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        avatarImageView.snp.makeConstraints { make in
            make.height.width.equalTo(100)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(8)
        }
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(86)
            make.height.equalTo(30)
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        dateOfBirth.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(32)
            make.left.right.equalToSuperview().inset(24)
        }
        groupId.snp.makeConstraints { make in
            make.top.equalTo(dateOfBirth.snp.bottom).offset(4)
            make.left.right.equalToSuperview().inset(24)
        }
        id.snp.makeConstraints { make in
            make.top.equalTo(groupId.snp.bottom).offset(4)
            make.left.right.equalToSuperview().inset(24)
        }
    }
    
    private func setupNavController() {
        let barButton = UIBarButtonItem(title: "Cохранить", style: .plain, target: self, action: #selector(saveProfile))
        barButton.tintColor = .enBlack
        navigationItem.rightBarButtonItem = barButton
    }
    @objc func saveProfile() {
        viewModel?.updateInfo(name: "Davlat",
                              surname: "Ushurbakiyev",
                              patronymic: "Alimzhanovich",
                              birthday: "2000-03-19",
                              group: "ITSE1909R")
        navigationController?.popViewController(animated: true)
    }
}
