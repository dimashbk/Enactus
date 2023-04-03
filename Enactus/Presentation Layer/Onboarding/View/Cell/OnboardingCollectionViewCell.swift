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
    // MARK: - Properties

    weak var delegate: OnBoardingCollectionViewCellDelegate?
    
    //MARK: - Views
    
    private lazy var imageView : UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .center

        return view
    }()
    
    private lazy var gradientTextLabel: GradientLabel = {
        let label = GradientLabel()
        label.font = UIFont(name: "Mulish-ExtraBold", size: 32)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.gradientColors = [UIColor.enFirstGradient.cgColor, UIColor.enSecondGradient.cgColor]
        
        return label
    }()
    
    private lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Mulish-ExtraBold", size: 32)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .white
        
        return label
    }()
    
    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Mulish-Regular", size: 16)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.textColor = .enGray
        
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
        [imageView, nextButton].forEach {
            contentView.addSubview($0)
        }
        [gradientTextLabel, firstLabel, secondLabel].forEach {
            imageView.addSubview($0)
        }
        
    }
    
    func makeConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        gradientTextLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIScreen.main.bounds.height/1.7)
            make.leading.equalToSuperview().inset(24)
            make.width.equalTo(UIScreen.main.bounds.width)
        }
        firstLabel.snp.makeConstraints{ make in
            make.top.equalTo(gradientTextLabel.snp.bottom).offset(6)
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
        gradientTextLabel.text = viewModel.gradientText
        firstLabel.text = viewModel.firstLabelText
        secondLabel.text = viewModel.secondLabelText
    }
}
