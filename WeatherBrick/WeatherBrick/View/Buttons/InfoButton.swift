//
//  infoButton.swift
//  WeatherBrick
//
//  Created by A A on 11.11.2021.
//

import UIKit

class InfoButton: UIButton {
    let backgroundLayer = Layer.gradientButtonInfoBackground()

    override func didMoveToSuperview() {
        // Frame
        frame.size = CGSize(width: Style.InfoButton.width, height: Style.InfoButton.height)
        layer.cornerRadius = Style.InfoButton.cornerRadius
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        clipsToBounds = true
        
        // Color
        backgroundLayer.frame = self.bounds
        layer.insertSublayer(backgroundLayer, at: 0)
        
        // Title
        setTitle("INFO", for: .normal)
        setTitleColor(Style.InfoButton.textColorNormal, for: .normal)
        titleLabel?.font = Style.InfoTitleLabel.font
        
        accessibilityIdentifier = Constant.Identifier.infoButton
        
        // Constants
        if let superview = superview {
            translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                widthAnchor.constraint(equalToConstant: Style.InfoButton.width),
                heightAnchor.constraint(equalToConstant: Style.InfoButton.height),
                bottomAnchor.constraint(equalTo: superview.bottomAnchor),
                centerXAnchor.constraint(equalTo: superview.centerXAnchor)
            ])
        }
    }
}
