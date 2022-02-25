//
//  Styles.swift
//  WeatherBrick
//
//  Created by A A on 07.11.2021.
//

import UIKit

enum Style {
    private static let window = UIWindow()
    
    enum GradientBackground {
        static let top = UIColor(red: 0.98, green: 0.863, blue: 0.353, alpha: 1).cgColor
        static let bottom = UIColor(red: 0.353, green: 0.784, blue: 0.98, alpha: 1).cgColor
    }
    
    enum GradientOnPull {
        static let top = UIColor.systemRed.cgColor
        static let bottom = UIColor.systemYellow.cgColor
    }
    
    enum GradientFade {
        static let top = UIColor.clear.withAlphaComponent(0.5).cgColor
        static let bottom = UIColor.white.withAlphaComponent(0.5).cgColor
    }
    
    enum MainView {
        static let width: CGFloat = window.frame.width
        static let height: CGFloat = window.frame.height
    }
    
    enum InfoView {
        static let width: CGFloat = 277
        static let height: CGFloat = 372
        static let gradientWidth: CGFloat = 267
        static let cornerRadius: CGFloat = 16
        static let gradientCornerRadius: CGFloat = 12
        static let backgroundColor = UIColor(red: 0.984, green: 0.373, blue: 0.161, alpha: 1)
    }
    
    enum StoneView {
        static let imageWidth = window.frame.width * 0.7
        static let imageHeight = imageWidth * 2.11
        static let containerWidth = imageWidth
        static let containerHeight = imageHeight + 80
        static let xPosition = imageWidth * 0.21
        static let yPosition = -xPosition * 2.11
        static let fogColor = UIColor.systemBlue.withAlphaComponent(0.16)
    }
    
    enum InfoButton {
        static let width: CGFloat = 175
        static let height: CGFloat = 60
        static let cornerRadius: CGFloat = 16
        static let textColorNormal = UIColor(red: 0.176, green: 0.176, blue: 0.176, alpha: 1)
        static let gradientTop = UIColor(red: 1, green: 0.6, blue: 0.376, alpha: 1).cgColor
        static let gradientBottom = UIColor(red: 0.976, green: 0.314, blue: 0.106, alpha: 1).cgColor
    }
    
    enum HideButton {
        static let width: CGFloat = 175
        static let height: CGFloat = 44
        static let cornerRadius: CGFloat = 16
        static let borderWidth: CGFloat = 1
        static let bottomAnchor: CGFloat = -24
        static let background = UIColor.clear
        static let borderColor = UIColor(red: 0.341, green: 0.341, blue: 0.341, alpha: 1).cgColor
        static let fontColorNormal = UIColor(red: 0.176, green: 0.176, blue: 0.176, alpha: 1)
    }
    
    enum TemperatureLabel {
        static let bottomAnchor: CGFloat = -130
        static let font = UIFont.systemFont(ofSize: 80, weight: .light)
        static let fontColorNormal = UIColor(red: 0.176, green: 0.176, blue: 0.176, alpha: 1)
    }
    
    enum WeatherConditionLabel {
        static let bottomAnchor: CGFloat = -110
        static let font = UIFont.systemFont(ofSize: 32, weight: .light)
        static let fontColorNormal = UIColor(red: 0.176, green: 0.176, blue: 0.176, alpha: 1)
    }
    
    enum LocationLabel {
        static let bottomAnchor: CGFloat = -80
        static let font = UIFont.systemFont(ofSize: 18, weight: .regular)
        static let fontColorNormal = UIColor(red: 0.176, green: 0.176, blue: 0.176, alpha: 1)
    }
    
    enum InfoTitleLabel {
        static let topAnchor: CGFloat = 24
        static let font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        static let fontColorNormal = UIColor(red: 0.176, green: 0.176, blue: 0.176, alpha: 1)
    }
    
    enum InfoDescriptionLabel {
        static let leadingAnchor: CGFloat = 30
        static let trailingAnchor: CGFloat = 30
        static let topAnchor: CGFloat = 60
        static let font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        static let fontColorNormal = UIColor(red: 0.176, green: 0.176, blue: 0.176, alpha: 1)
    }
}
