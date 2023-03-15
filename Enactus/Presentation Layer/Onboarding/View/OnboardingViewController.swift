//
//  OnboardingViewController.swift
//  Enactus
//
//  Created by Dinmukhamed on 14.03.2023.
//

import UIKit
import SnapKit

final class OnboardingViewController: UIViewController{
    var sections: [Section] = [.init(section: .onboarding, rows: [.first, .second, .third])]

    private lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .enBlack
        cv.register(cellClass: OnBoardingCollectionViewCell.self)
        
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    func setup() {
        setupViews()
        configureCollectionView()
        makeConstraints()
    }
    
    func setupViews() {
        view.addSubview(collectionView)
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func makeConstraints() {
        collectionView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    


}
extension OnboardingViewController: OnBoardingCollectionViewCellDelegate {
    func cell(_ cell: UICollectionViewCell, nextButtonDidTap button: UIButton) {
        guard let index = collectionView.indexPath(for: cell)?.row else { return }
        if (index < 2) {
            collectionView.scrollToItem(at: IndexPath(row: index+1, section: 0), at: .right, animated: true)
        } else {
            collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .left, animated: true)
        }
    }
}

