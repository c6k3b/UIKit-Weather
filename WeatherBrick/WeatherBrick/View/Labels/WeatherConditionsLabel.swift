//
//  WeatherConditionsLabel.swift
//  WeatherBrick
//
//  Created by A A on 11.11.2021.
//

import UIKit

class WeatherConditionsLabel: UILabel {
    override func didMoveToSuperview() {
        // Text
        font = Style.WeatherConditionLabel.font
        textColor = Style.WeatherConditionLabel.fontColorNormal
        textAlignment = .left
        
        accessibilityIdentifier = Constant.Identifier.weatherConditionsLabel
        
        // Constraints
        if let superview = superview {
            translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                leadingAnchor.constraint(equalTo: superview.leadingAnchor),
                trailingAnchor.constraint(equalTo: superview.trailingAnchor),
                bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: Style.WeatherConditionLabel.bottomAnchor)
            ])
        }
    }
}
