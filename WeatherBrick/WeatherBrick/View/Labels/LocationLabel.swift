//
//  LocationLabel.swift
//  WeatherBrick
//
//  Created by A A on 11.11.2021.
//

import UIKit

class LocationLabel: UILabel {
    override func didMoveToSuperview() {
        // Text
        font = Style.LocationLabel.font
        textColor = Style.LocationLabel.fontColorNormal
        textAlignment = .center
        
        accessibilityIdentifier = Constant.Identifier.locationLabel
        
        // Constraints
        if let superview = superview {
            translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                leadingAnchor.constraint(equalTo: superview.layoutMarginsGuide.leadingAnchor),
                trailingAnchor.constraint(equalTo: superview.layoutMarginsGuide.trailingAnchor),
                bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: Style.LocationLabel.bottomAnchor)
            ])
        }
    }
}
