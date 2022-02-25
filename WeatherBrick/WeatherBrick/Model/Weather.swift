//
//  Weather.swift
//  WeatherBrick
//
//  Created by A A on 10.11.2021.
//

import CoreLocation
import UIKit
import Network

class Weather {
    // MARK: - Properties
    private var temperature = 0.0
    private var weatherConditions = ""
    private var city = ""
    private var country = ""
    private var windSpeed = 0.0
    private var conditionsId = 0
    
    private var isVeryHot: Bool { return temperature > 30 ? true : false }
    private var isFog: Bool { return 741 ~= conditionsId ? true : false }
    private var isWindy: Bool { return windSpeed > Constant.WindSpeed.windy ? true : false }
    private var isConnectedToNetwork: Bool { return Reachability.isConnectedToNetwork() ? true : false }
    
    var stoneImageView = UIImageView(image: UIImage(named: Constant.StoneImages.normal.rawValue))
    var temperatureString: String { return String(format: "%.0f" + "ºC", temperature) }
    var locationString: String { return "\(city) \(country)" }
    var conditionsString: String { return weatherConditions.capitalized }
    
    private let appId = "894bcf6986ad242d0d251c13dcaf8621"
    
    // MARK: - Singleton
    static var _sharedInstance: Weather?  // swiftlint:disable:this identifier_name
    
    class func sharedInstance() -> Weather {
        if _sharedInstance == nil {
            _sharedInstance = Weather()
        }
        return _sharedInstance!
    }
    
    // MARK: - Methods
    func getWeatherData(lat: CLLocationDegrees, lon: CLLocationDegrees) {
        let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&units=metric&appid=\(appId)"
        let jsonDecoder = JSONDecoder()
        guard let url = URL(string: weatherUrl) else { return }
        do {
            let jsonData = try Data(contentsOf: url)
            let decodedData = try jsonDecoder.decode(WeatherData.self, from: jsonData)
            self.temperature = decodedData.main.temp
            self.weatherConditions = decodedData.weather[0].main
            self.city = decodedData.name
            self.country = decodedData.sys.country
            self.windSpeed = decodedData.wind.speed
            self.conditionsId = decodedData.weather[0].id
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func updateImage() {
        DispatchQueue.main.async {
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
}
