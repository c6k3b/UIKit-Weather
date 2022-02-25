//
//  InfoTitleLabel.swift
//  WeatherBrick
//
//  Created by A A on 11.11.2021.
//

import UIKit

class InfoTitleLabel: UILabel {
    
    override func didMoveToWindow() {
        // Frame
        translatesAutoresizingMaskIntoConstraints = false
        
        // Text
        text = "INFO"
        font = Style.InfoTitleLabel.font
        textColor = Style.InfoTitleLabel.fontColorNormal
        textAlignment = .center
        
        accessibilityIdentifier = Constant.Identifier.infoTitleLabel
        
        // Constraints
        if let superview = superview {
            NSLayoutConstraint.activate([
                leadingAnchor.constraint(equalTo: superview.layoutMarginsGuide.leadingAnchor),
                trailingAnchor.constraint(equalTo: superview.layoutMarginsGuide.trailingAnchor),
                topAnchor.constraint(equalTo: superview.topAnchor, constant: Style.InfoTitleLabel.topAnchor)
            ])
        }
    }
}
