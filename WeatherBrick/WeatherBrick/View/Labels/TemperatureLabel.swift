//
//  TemperatureLabel.swift
//  WeatherBrick
//
//  Created by A A on 11.11.2021.
//

import UIKit

class TemperatureLabel: UILabel {
    override func didMoveToSuperview() {
        // Text
        font = Style.TemperatureLabel.font
        textColor = Style.TemperatureLabel.fontColorNormal
        
        accessibilityIdentifier = Constant.Identifier.temperatureLabel
        
        // Constraints
        if let superview = superview {
            translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                leadingAnchor.constraint(equalTo: superview.leadingAnchor),
                trailingAnchor.constraint(equalTo: superview.trailingAnchor),
                bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: Style.TemperatureLabel.bottomAnchor)
            ])
        }
    }
}
