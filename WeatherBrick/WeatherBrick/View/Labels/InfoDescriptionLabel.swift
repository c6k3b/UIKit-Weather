//
//  InfoDescriptionLabel.swift
//  WeatherBrick
//
//  Created by A A on 11.11.2021.
//

import UIKit

class InfoDescriptionLabel: UILabel {
    override func didMoveToWindow() {
        // Frame
        translatesAutoresizingMaskIntoConstraints = false
        
        // Text
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.68
        let attributedText = NSMutableAttributedString(string:
            """
             Brick is wet - raining
             Brick is dry - sunny
             Brick is hard to see - fog
             Brick with cracks - very hot
             Brick with snow - snow
             Brick is swinging- windy
             Brick is gone - No Internet
            """)
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedText.length))
        
        self.attributedText = attributedText
        numberOfLines = 0
        font = Style.InfoDescriptionLabel.font
        textColor = Style.InfoDescriptionLabel.fontColorNormal
        textAlignment = .left
        
        accessibilityIdentifier = Constant.Identifier.infoDescriptionLabel
        
        // Constraints
        if let superview = superview {
            NSLayoutConstraint.activate([
                leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: Style.InfoDescriptionLabel.leadingAnchor),
                trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: Style.InfoDescriptionLabel.trailingAnchor),
                topAnchor.constraint(equalTo: superview.topAnchor, constant: Style.InfoDescriptionLabel.topAnchor)
            ])
        }
    }
}
