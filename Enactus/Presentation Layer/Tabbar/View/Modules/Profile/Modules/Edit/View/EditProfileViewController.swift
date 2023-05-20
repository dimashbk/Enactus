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
        imageView.image = .init(named: "AppIcon")
        return imageView
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.text = (profileInfo.name ?? "") + " " + (profileInfo.surname ?? "")
        textField.font = UIFont(name: "Mulish", size: 24)
        textField.placeholder = "Name Surname"
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
        editCell.textField.placeholder = "YYYY-MM-DD"
        return editCell
    }()
    
    private lazy var groupId: EditCellView = {
        let editCell = EditCellView()
        editCell.label.text = "Группа"
        editCell.textField.text = profileInfo.group
        editCell.textField.placeholder = "Group"
        return editCell
    }()
    
    private lazy var patronymic: EditCellView = {
        let editCell = EditCellView()
        editCell.label.text = "Отчество"
        editCell.textField.text = profileInfo.patronymic
        editCell.textField.placeholder = "Patronymic"
        return editCell
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameTextField.becomeFirstResponder()
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
         nameTextField, dateOfBirth, groupId, patronymic].forEach {
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
//        patronymic.snp.makeConstraints { make in
//            make.top.equalTo(groupId.snp.bottom).offset(4)
//            make.left.right.equalToSuperview().inset(24)
//        }
    }
    
    private func setupNavController() {
        let barButton = UIBarButtonItem(title: "Cохранить", style: .plain, target: self, action: #selector(saveProfile))
        barButton.tintColor = .enBlack
        navigationItem.rightBarButtonItem = barButton
    }
    @objc func saveProfile() {
        
        var separated = nameTextField.text?.split(separator: " ")
        
        var name =  {
            if  separated?.count ?? 0 > 0 {
                return String(separated?[0] ?? "")
            } else {
                return ""
            }
        }
        
        var surname = {
            if separated?.count ?? 0 > 1 {
                     return String(separated?[1] ?? "")
            } else {
                    return ""
                }
            }
        
        self.viewModel?.updateInfo(name: name(),
                              surname: surname(),
                                       patronymic: "ZharaZhara" ,
                                       birthday: self.dateOfBirth.textField.text,
                                       group: self.groupId.textField.text)
        
        
        navigationController?.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches:Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
}
