//
//  MainView.swift
//  WeatherBrick
//
//  Created by A A on 11.11.2021.
//

import UIKit

class MainView: UIView {
    
    let temperatureLabel = TemperatureLabel()
    let weatherConditionLabel = WeatherConditionsLabel()
    let locationLabel = LocationLabel()
    let infoButton = InfoButton()
    
    override func didMoveToSuperview() {
        addSubview(temperatureLabel)
        addSubview(weatherConditionLabel)
        addSubview(locationLabel)
        addSubview(infoButton)
        
        accessibilityIdentifier = Constant.Identifier.mainView
        
        if let superview = superview {
            translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                leadingAnchor.constraint(equalTo: superview.layoutMarginsGuide.leadingAnchor),
                trailingAnchor.constraint(equalTo: superview.layoutMarginsGuide.trailingAnchor),
                topAnchor.constraint(equalTo: superview.topAnchor),
                bottomAnchor.constraint(equalTo: superview.bottomAnchor)
            ])
        }
    }
}
