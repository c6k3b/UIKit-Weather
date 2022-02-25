//
//  ViewController.swift
//  WeatherBrick
//
//  Created by A A on 07.11.2021.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController {
    // MARK: - Properties
    private let mainView = MainView()
    private let infoView = InfoView()
    private let stoneViewController = StoneViewController()
    private let gradientBackground = Layer.gradientBackground()
    private let notificationCenter = NotificationCenter.default
    
    private var state: AppState = MainViewController.state
    private let locationManager = CLLocationManager()
    
    private var isMainReturnedFromInfoView = false
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0),
                                    size: CGSize(width: Style.MainView.width, height: Style.MainView.height)))
        
        locationManager.delegate = self
        setNotificationsObservers()
        getLocation()
        
        view.addSubview(mainView)
        view.addSubview(infoView)
        infoView.alpha = 0
        
        view.addSubview(stoneViewController.view)
        addChild(stoneViewController)
        
        view.layer.insertSublayer(gradientBackground, at: 0)
        gradientBackground.frame = view.bounds
        
        UIView.animate(withDuration: 0) {} completion: { _ in
            self.setViews()
        }
        
        // Actions
        mainView.infoButton.addTarget(self, action: #selector(postNotificationStateChangedToInfo), for: .touchDown)
        infoView.hideButton.addTarget(self, action: #selector(postNotificationStateChangedToMain), for: .touchDown)
    }
    
    // MARK: - Methods
    private func setViews() {
        switch state {
            case .main:
                UIView.transition(with: view, duration: 1, options: isMainReturnedFromInfoView ? .transitionCurlDown : .curveEaseOut) {
                    self.mainView.alpha = 1
                    self.infoView.alpha = 0
                    self.stoneViewController.view.alpha = 1
                    self.gradientBackground.colors = [Style.GradientBackground.top, Style.GradientBackground.bottom]
                } completion: { _ in
                    self.isMainReturnedFromInfoView = false
                    
                }
                
            case .info:
                UIView.transition(with: view, duration: 1, options: .transitionCurlUp) {
                    self.mainView.alpha = 0
                    self.infoView.alpha = 1
                    self.stoneViewController.view.alpha = 0
                } completion: { _ in
                    self.isMainReturnedFromInfoView = true
                }
                
            case .updating:
                self.stoneViewController.view.alpha = 0
                UIView.transition(with: view, duration: 1.5, options: .curveLinear) {
                    self.stoneViewController.view.alpha = 1
                    self.gradientBackground.colors = [Style.GradientOnPull.top, Style.GradientOnPull.bottom]
                } completion: { _ in
                    self.postNotificationStateChangedToMain()
                }
        }
    }
    
    private func setLabels() {
        DispatchQueue.main.async {
            let weather = Weather.sharedInstance()
            self.mainView.temperatureLabel.text = weather.temperatureString
            self.mainView.weatherConditionLabel.text = weather.conditionsString
            self.mainView.locationLabel.text = weather.locationString
            self.locationManager.stopUpdatingLocation()
        }
    }
}

// MARK: - Notifications
extension MainViewController {
    private static var state: AppState = .updating
    
    private enum AppState: String {
        case main, info, updating
    }
    
    private func setNotificationsObservers() {
        notificationCenter.addObserver(self, selector: #selector(changeStateToMain), name: NSNotification.Name(AppState.main.rawValue), object: nil)
        notificationCenter.addObserver(self, selector: #selector(changeStateToInfo), name: NSNotification.Name(AppState.info.rawValue), object: nil)
        notificationCenter.addObserver(self, selector: #selector(changeStateToUpdating), name: NSNotification.Name(AppState.updating.rawValue), object: nil)
    }
    
    @objc private func postNotificationStateChangedToMain() { notificationCenter.post(name: NSNotification.Name(AppState.main.rawValue), object: nil) }
    @objc private func postNotificationStateChangedToInfo() { notificationCenter.post(name: NSNotification.Name(AppState.info.rawValue), object: nil) }
    @objc func postNotificationStateChangedToUpdating() { notificationCenter.post(name: NSNotification.Name(AppState.updating.rawValue), object: nil) }
    
    // MARK: - State Change
    @objc private func changeStateToMain() {
        state = .main
        notificationCenter.removeObserver(self)
        loadView()
    }
    
    @objc private func changeStateToInfo() {
        state = .info
        notificationCenter.removeObserver(self)
        loadView()
    }
    
    @objc private func changeStateToUpdating() {
        state = .updating
        notificationCenter.removeObserver(self)
        loadView()
    }
}

// MARK: - Location
extension MainViewController: CLLocationManagerDelegate {
    private func getLocation() {
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.requestWhenInUseAuthorization()
        
        let locationStatus = CLLocationManager.authorizationStatus()
        switch locationStatus {
            case .authorizedAlways, .authorizedWhenInUse:
                locationManager.startUpdatingLocation()
            default: break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        let lat = location.coordinate.latitude
        let lon = location.coordinate.longitude
        
        DispatchQueue.global(qos: .background).async {
            Weather.sharedInstance().getWeatherData(lat: lat, lon: lon)
            Weather.sharedInstance().updateImage()
            DispatchQueue.main.async {
                self.setLabels()
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location")
    }
}
