//
//  OnboardingCollectionView.swift
//  Enactus
//
//  Created by Dinmukhamed on 15.03.2023.
//

import Foundation
import UIKit

extension OnboardingViewController:  UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].rows.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let rows = sections[indexPath.section].rows[indexPath.row]
        switch rows {
        case .first, .second:
            let viewCell: OnBoardingCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            viewCell.configure(with: OnBoardingCollectionViewCellViewModel(row: rows))
            viewCell.delegate = self
            
            return viewCell
        case .third:
            let viewCell: WelcomeCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            viewCell.signInButton.addTarget(self, action: #selector(moveToSignIn), for: .touchUpInside)
            viewCell.logInButton.addTarget(self, action: #selector(moveToLogIn), for: .touchUpInside)
            return viewCell
        }
    }
}
