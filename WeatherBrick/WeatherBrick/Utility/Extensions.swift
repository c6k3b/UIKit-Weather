//
//  Extensions.swift
//  WeatherBrick
//
//  Created by A A on 15.11.2021.
//

import UIKit

extension UIView {
    func windSwinging() {
        let animationX = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animationX.timingFunctions = [CAMediaTimingFunction(name: .easeIn)]
        animationX.values = [-20, 20, -20]
        
        let animationY = CAKeyframeAnimation(keyPath: "transform.translation.y")
        animationY.timingFunctions = [CAMediaTimingFunction(name: .easeIn)]
        animationY.values = [0, 10, 0, 10, 0]
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [animationX, animationY]
        animationGroup.duration = 2
        animationGroup.repeatCount = .infinity
        
        layer.add(animationGroup, forKey: "windSwinging")
    }
}

 extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
 }
