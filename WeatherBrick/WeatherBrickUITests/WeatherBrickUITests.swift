//
//  WeatherBrickUITests.swift
//  WeatherBrickUITests
//
//  Created by A A on 16.11.2021.
//

import XCTest

class WeatherBrickUITests: XCTestCase {
    let app = XCUIApplication()
 
    // Views
    var mainView: XCUIElement!
    var infoView: XCUIElement!
    var stoneImageView: XCUIElement!
    var stoneView: XCUIElement!
    
    // Labels
    var temperatureLabel: XCUIElement!
    var weatherConditionsLabel: XCUIElement!
    var locationLabel: XCUIElement!
    var infoTitleLabel: XCUIElement!
    var infoDescriptionLabel: XCUIElement!
    
    // Buttons
    var infoButton: XCUIElement!
    var hideButton: XCUIElement!
 
    override func setUp() {
        super.setUp()
        XCUIDevice.shared.orientation = .portrait
//        app.launchEnvironment = ["animations": "0"]
 
        app.launch()
        
        // Vieww
        mainView = app.otherElements[Constant.Identifier.mainView].firstMatch
        infoView = app.otherElements[Constant.Identifier.infoView].firstMatch
        stoneView = app.otherElements[Constant.Identifier.stoneView].firstMatch
        stoneImageView = app.images[Constant.Identifier.stoneImageView].firstMatch
        
        // Labels
        temperatureLabel = mainView.staticTexts[Constant.Identifier.temperatureLabel].firstMatch
        weatherConditionsLabel = mainView.staticTexts[Constant.Identifier.weatherConditionsLabel].firstMatch
        locationLabel = mainView.staticTexts[Constant.Identifier.locationLabel].firstMatch
        infoTitleLabel = infoView.staticTexts[Constant.Identifier.infoTitleLabel].firstMatch
        infoDescriptionLabel = infoView.staticTexts[Constant.Identifier.infoDescriptionLabel].firstMatch
        
        // Buttons
        infoButton = mainView.buttons[Constant.Identifier.infoButton].firstMatch
        hideButton = infoView.buttons[Constant.Identifier.hideButton].firstMatch
    }
    
    func testElementExist() {
        XCTAssertNotNil(mainView)
        XCTAssertNotNil(infoView)
        XCTAssertNotNil(stoneImageView)
        XCTAssertNotNil(stoneView)
        
        XCTAssertNotNil(temperatureLabel)
        XCTAssertNotNil(weatherConditionsLabel)
        XCTAssertNotNil(locationLabel)
        
        XCTAssertNotNil(infoTitleLabel)
        XCTAssertNotNil(infoDescriptionLabel)
        
        XCTAssertNotNil(infoButton)
        XCTAssertNotNil(hideButton)
    }
    
    func testElementAppearance() {
        
        XCTAssertEqual(infoButton.label, "INFO")
        XCTAssertTrue(mainView.exists)
        XCTAssertTrue(mainView.isHittable)
        XCTAssertTrue(stoneImageView.exists)
        XCTAssertTrue(stoneView.exists)
        XCTAssertTrue(stoneView.isHittable)
        XCTAssertFalse(infoView.exists)
        XCTAssertFalse(infoView.isHittable)
        
        infoButton.tap()
        
        XCTAssertFalse(mainView.exists)
        XCTAssertFalse(mainView.isHittable)
        XCTAssertFalse(stoneView.exists)
        XCTAssertFalse(stoneView.isHittable)
        XCTAssertFalse(stoneImageView.exists)
        XCTAssertTrue(infoView.exists)
        XCTAssertTrue(infoView.isHittable)
        XCTAssertTrue(hideButton.exists)
        XCTAssertEqual(hideButton.label, "Hide")
        XCTAssertTrue(infoTitleLabel.exists)
        XCTAssertEqual(infoTitleLabel.label, "INFO")
        XCTAssertTrue(infoDescriptionLabel.exists)
        
        hideButton.tap()
        
        XCTAssertTrue(mainView.exists)
        XCTAssertTrue(mainView.isHittable)
        XCTAssertTrue(stoneView.exists)
        XCTAssertTrue(stoneView.isHittable)
        XCTAssertTrue(stoneImageView.exists)
        XCTAssertFalse(infoView.exists)
        XCTAssertFalse(infoView.isHittable)
    }
    
    func testApp() {
        app.terminate()
    }
}
