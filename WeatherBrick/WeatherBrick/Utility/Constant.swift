//
//  Constants.swift
//  WeatherBrick
//
//  Created by A A on 15.11.2021.
//

import Foundation

enum Constant {
    enum StoneImages: String {
        case normal = "images/image_stone_normal",
             wet = "images/image_stone_wet",
             cracks = "images/image_stone_cracks",
             snow = "images/image_stone_snow"
    }
    
    enum WindSpeed {
        static let windy: Double = 10.8 // Beaufort scale 6 
    }
    
    enum Identifier {
        static let mainViewController = "mainViewController"
        
        static let mainView = "mainView"
        static let infoView = "infoView"
        static let stoneImageView = "stoneImageView"
        static let stoneView = "stoneView"
        
        static let temperatureLabel = "temperatureLabel"
        static let weatherConditionsLabel = "weatherConditionsLabel"
        static let locationLabel = "locationLabel"
        static let infoTitleLabel = "infoTitleLabel"
        static let infoDescriptionLabel = "infoDescriptionLabel"
        
        static let infoButton = "infoButton"
        static let hideButton = "hideButton"
    }
}
