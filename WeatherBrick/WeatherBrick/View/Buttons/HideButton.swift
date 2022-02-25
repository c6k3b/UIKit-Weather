//
//  HideButton.swift
//  WeatherBrick
//
//  Created by A A on 11.11.2021.
//

import UIKit

class HideButton: UIButton {
    
    override func didMoveToSuperview() {
        // Frame
        layer.cornerRadius = Style.HideButton.cornerRadius
        
        // Color
        backgroundColor = Style.HideButton.background
        layer.borderColor = Style.HideButton.borderColor
        layer.borderWidth = Style.HideButton.borderWidth
        
        // Title
        setTitle("Hide", for: .normal)
        setTitleColor(Style.HideButton.fontColorNormal, for: .normal)
        titleLabel?.font = Style.InfoTitleLabel.font
        
        accessibilityIdentifier = Constant.Identifier.hideButton
        
        // Constraints
        if let superview = superview {
            translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                widthAnchor.constraint(equalToConstant: Style.HideButton.width),
                heightAnchor.constraint(equalToConstant: Style.HideButton.height),
                centerXAnchor.constraint(equalTo: superview.layoutMarginsGuide.centerXAnchor),
                bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: Style.HideButton.bottomAnchor)
            ])
        }
    }
}
