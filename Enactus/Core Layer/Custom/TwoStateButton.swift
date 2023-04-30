//
//  TwoStateButton.swift
//  Enactus
//
//  Created by Dinmukhamed on 20.04.2023.
//

import UIKit

enum ButtonStates {
    case disabled
    case enabled
}

class TwoStateButton: UIButton {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 8
        titleLabel?.font = UIFont(name: "Mulish", size: 16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeState(state: ButtonStates) {
        switch state {
        case .disabled:
            layer.borderWidth = 1
            layer.borderColor = UIColor.white.cgColor
            backgroundColor = UIColor(red: 22/255, green: 27/255, blue: 30/255, alpha: 1)
        case .enabled:
            layer.borderWidth = 0
            backgroundColor = UIColor.enBlue
        }
    }

}
