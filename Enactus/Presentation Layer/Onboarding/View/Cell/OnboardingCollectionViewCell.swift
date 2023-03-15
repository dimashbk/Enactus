//
//  OnboardingCollectionViewCell.swift
//  Enactus
//
//  Created by Dinmukhamed on 15.03.2023.
//


import UIKit

protocol OnBoardingCollectionViewCellDelegate: AnyObject {
    func cell(_ cell: UICollectionViewCell, nextButtonDidTap button: UIButton)
}

class OnBoardingCollectionViewCell : UICollectionViewCell{
    override class func description() -> String {
        return "OnBoardingCollectionViewCell"
    }
    
    // MARK: - Properties

    weak var delegate: OnBoardingCollectionViewCellDelegate?
    
    //MARK: - Views
    
    private lazy var imageView : UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .center

        return view
    }()
    private lazy var labelImage : UIImageView = {
        let img = UIImageView()
        img.image = .init(named: "OnboardingLabel")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    private lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.text = "and make your student life easier"
        label.font = UIFont(name: "Mulish-ExtraBold", size: 32)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .left
        
        return label
    }()
    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "Accumulate bonuses and pay off your debts"
        label.font = UIFont(name: "Mulish-Regular", size: 16)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(red: 0.475, green: 0.486, blue: 0.477, alpha: 1)
        return label
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "nextButton"), for: .normal)
        button.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
        
        return button
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
    
    @objc
    private func nextButtonDidTap(_ sender: UIButton) {
        delegate?.cell(self, nextButtonDidTap: sender)
    }
    
    func setup() {
        setupViews()
        makeConstraints()
    }
    
    func setupViews() {
        [imageView, firstLabel, secondLabel, nextButton].forEach{
            contentView.addSubview($0)
        }
        imageView.addSubview(labelImage)
    }
    
    func makeConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        labelImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().inset(276)
        }
        
        firstLabel.snp.makeConstraints{ make in
            make.top.equalTo(labelImage.snp.bottom).offset(6)
            make.left.right.equalToSuperview().inset(24)
        }
        secondLabel.snp.makeConstraints{ make in
            make.top.equalTo(firstLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().inset(64)
        }
        
        nextButton.snp.makeConstraints{ make in
            make.leading.equalTo(24)
            make.top.equalTo(secondLabel.snp.bottom).offset(32)
        }
    }
    
    public func configure(with viewModel: OnBoardingCollectionViewCellViewModelProtocol) {
        imageView.image = UIImage(named: viewModel.imageName)
    }
}
