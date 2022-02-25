//
//  WeatherBrickTests.swift
//  WeatherBrickTests
//
//  Created by A A on 15.11.2021.
//

import XCTest
@testable import WeatherBrick

class WeatherBrickTests: XCTestCase {
    let weather = Weather.sharedInstance()
    let mainViewController = MainViewController()
    let stoneViewController = StoneViewController()
    let mainView = MainView()
    let infoView = InfoView()
    
    func testLocation() throws {
        weather.getWeatherData(lat: 55.75222, lon: 37.61556)
        XCTAssertNotNil(weather)
        
        XCTAssertNotNil(weather.temperatureString)
        XCTAssertEqual(weather.locationString, "Moscow RU")
        XCTAssertNotNil(weather.conditionsString)
    }
    
    func testUpdateImage() throws {
        weather.updateImage()
        XCTAssertNotNil(weather.stoneImageView)
    }
    
    // FakeWeatherTests
    let fakeWeather = FakeWeather()
    
    func testFakeWeatherLabels() throws {
        fakeWeather.temperature = 20.7
        fakeWeather.weatherConditions = "very cold"
        fakeWeather.city = "Paris"
        fakeWeather.country = "FR"

        XCTAssertEqual(fakeWeather.temperatureString, "21ºC")
        XCTAssertEqual(fakeWeather.conditionsString, "Very Cold")
        XCTAssertEqual(fakeWeather.locationString, "Paris FR")
    }
    
    func testFakeWeatherBooleans() throws {
        XCTAssertFalse(fakeWeather.isFog)
        XCTAssertFalse(fakeWeather.isWindy)
        XCTAssertFalse(fakeWeather.isVeryHot)
        
        fakeWeather.temperature = 30.7
        fakeWeather.conditionsId = 741
        fakeWeather.windSpeed = 11.5
        
        XCTAssertTrue(fakeWeather.isFog)
        XCTAssertTrue(fakeWeather.isWindy)
        XCTAssertTrue(fakeWeather.isVeryHot)
    }
    
    func testFakeWeatherImages() throws {
        XCTAssertEqual(fakeWeather.stoneImageView.image, UIImage(named: Constant.StoneImages.normal.rawValue))
        
        fakeWeather.conditionsId = 400
        fakeWeather.updateImage()
        XCTAssertEqual(fakeWeather.stoneImageView.image, UIImage(named: Constant.StoneImages.wet.rawValue))
        
        fakeWeather.conditionsId = 622
        fakeWeather.updateImage()
        XCTAssertEqual(fakeWeather.stoneImageView.image, UIImage(named: Constant.StoneImages.snow.rawValue))
       
        fakeWeather.conditionsId = 150
        fakeWeather.updateImage()
        XCTAssertEqual(fakeWeather.stoneImageView.image, UIImage(named: Constant.StoneImages.normal.rawValue))
        
        fakeWeather.temperature = 30.7
        fakeWeather.updateImage()
        XCTAssertEqual(fakeWeather.stoneImageView.image, UIImage(named: Constant.StoneImages.cracks.rawValue))
        
        fakeWeather.conditionsId = 741
        fakeWeather.updateImage()
        XCTAssertTrue((fakeWeather.stoneImageView.image?.withTintColor(Style.StoneView.fogColor)) != nil)
        
        fakeWeather.windSpeed = 11
        fakeWeather.updateImage()
        XCTAssertTrue(fakeWeather.stoneImageView.layer.animation(forKey: "windSwinging") != nil)
        
        fakeWeather.isConnectedToNetwork = false
        fakeWeather.updateImage()
        XCTAssertFalse((fakeWeather.stoneImageView.image == nil))
    }

    // Performance
    func testPerformanceGetWeatherData() throws {
        measure { weather.getWeatherData(lat: 55.75222, lon: 37.61556) }
    }
    
    func testPerformanceUpdateImage() throws {
        measure { weather.updateImage() }
    }
    
    func testPerformanceLoadViewMain() throws {
        measure { mainViewController.loadView() }
    }
    
    func testPerformanceLoadViewStone() throws {
        measure { stoneViewController.loadView() }
    }
    
    func testPerformanceReachability() throws {
        measure { _ = Reachability.isConnectedToNetwork()}
    }
    
    func testPerformanceMainView() throws {
        measure { mainView.didMoveToSuperview() }
    }
    
    func testPerformanceInfoView() throws {
        measure { infoView.didMoveToSuperview() }
    }
}
