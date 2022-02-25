//
//  Layer.swift
//  WeatherBrick
//
//  Created by A A on 07.11.2021.
//

import UIKit

enum Layer {
    
    static func gradientBackground() -> CAGradientLayer {
        let gradientBackground = CAGradientLayer()
        let colorTop = Style.GradientBackground.top
        let colorBottom = Style.GradientBackground.bottom
        gradientBackground.colors = [colorTop, colorBottom]
        gradientBackground.locations = [0, 1]
        return gradientBackground
    }
    
    static func gradientButtonInfoBackground() -> CAGradientLayer {
        let gradientButtonInfo = CAGradientLayer()
        let colorTop = Style.InfoButton.gradientTop
        let colorBottom = Style.InfoButton.gradientBottom
        gradientButtonInfo.colors = [colorTop, colorBottom]
        gradientButtonInfo.locations = [0, 1]
        return gradientButtonInfo
    }
}
