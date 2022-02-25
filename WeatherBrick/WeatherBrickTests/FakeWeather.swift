//
//  FakeWeather.swift
//  WeatherBrickTests
//
//  Created by A A on 16.11.2021.
//

import UIKit
@testable import WeatherBrick

class FakeWeather {
    // MARK: - Properties
    var temperature = 0.0
    var weatherConditions = ""
    var city = ""
    var country = ""
    var windSpeed = 0.0
    var conditionsId = 0
    
    var isVeryHot: Bool { return temperature > 30 ? true : false }
    var isFog: Bool { return 741 ~= conditionsId ? true : false }
    var isWindy: Bool { return windSpeed > Constant.WindSpeed.windy ? true : false }
    var isConnectedToNetwork: Bool = true
    var stoneImageView = UIImageView(image: UIImage(named: Constant.StoneImages.normal.rawValue))
    var temperatureString: String { return String(format: "%.0f" + "ºC", temperature) }
    var locationString: String { return "\(city) \(country)" }
    var conditionsString: String { return weatherConditions.capitalized }
    
    func updateImage() {
        switch self.conditionsId {
            case 300 ... 531 : self.stoneImageView.image = UIImage(named: Constant.StoneImages.wet.rawValue)
            case 600 ... 622 : self.stoneImageView.image = UIImage(named: Constant.StoneImages.snow.rawValue)
            default: self.stoneImageView.image = UIImage(named: Constant.StoneImages.normal.rawValue)
        }
        
        if self.isVeryHot { self.stoneImageView.image = UIImage(named: Constant.StoneImages.cracks.rawValue) }
        if !self.isConnectedToNetwork { self.stoneImageView.image = UIImage() }
        if self.isFog { self.stoneImageView.setImageColor(color: Style.StoneView.fogColor) }
        if self.isWindy { self.stoneImageView.windSwinging() }
        if !self.isWindy { self.stoneImageView.layer.removeAllAnimations() }
    }
}
