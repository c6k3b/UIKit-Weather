//
//  InfoView.swift
//  WeatherBrick
//
//  Created by A A on 11.11.2021.
//

import UIKit

class InfoView: UIView {
    
    let gradient = Layer.gradientButtonInfoBackground()
    let titleLabel = InfoTitleLabel()
    let descriptionLabel = InfoDescriptionLabel()
    let hideButton = HideButton()

    override func didMoveToSuperview() {
        // Frame
        layer.cornerRadius = Style.InfoView.cornerRadius
        clipsToBounds = true
        gradient.frame.size = CGSize(width: Style.InfoView.gradientWidth, height: Style.InfoView.height)
        gradient.cornerRadius = Style.InfoView.gradientCornerRadius
        
        // Color
        backgroundColor = Style.InfoView.backgroundColor
        layer.insertSublayer(gradient, at: 0)
        
        // Subviews
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(hideButton)
        
        accessibilityIdentifier = Constant.Identifier.infoView
        
        if let superview = superview {
            translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                widthAnchor.constraint(equalToConstant: Style.InfoView.width),
                heightAnchor.constraint(equalToConstant: Style.InfoView.height),
                centerXAnchor.constraint(equalTo: superview.centerXAnchor),
                centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            ])
        }
    }
}
