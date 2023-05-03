//
//  WalletViewController.swift
//  Enactus
//
//  Created by Dinmukhamed on 28.04.2023.
//

import UIKit

final class WalletViewController: UIViewController {
    
    private lazy var gradientCard: CardGradientView = {
        let view = CardGradientView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    private func setup() {
        self.title = "Кошелек"
        view.backgroundColor = .white
        setupSubviews()
        setupConstraints()
    }
    private func setupSubviews() {
        [gradientCard].forEach {
            view.addSubview($0)
        }
    }
    private func setupConstraints() {
        gradientCard.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.centerX.equalToSuperview()
            make.height.equalTo(220)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
