//
//  StoneViewController.swift
//  WeatherForecastBrick
//
//  Created by A A on 06.11.2021.
//

import UIKit

class StoneViewController: UIViewController {
    
    // MARK: - Properties
    private let stoneView = UIView()
    
    private lazy var dynamicAnimator = UIDynamicAnimator(referenceView: view)
    private lazy var attachment = UIAttachmentBehavior(item: stoneView, attachedToAnchor: .zero)
    private lazy var panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(sender:)))
    
    private lazy var collision: UICollisionBehavior = {
        let collision = UICollisionBehavior(items: [stoneView])
        collision.translatesReferenceBoundsIntoBoundary = true
        return collision
    }()
    
    private lazy var gravity: UIGravityBehavior = {
        let gravity = UIGravityBehavior(items: [stoneView])
        gravity.gravityDirection = .init(dx: 0, dy: -1)
        return gravity
    }()
    
    private lazy var itemBehavior: UIDynamicItemBehavior = {
        let itemBehavior = UIDynamicItemBehavior(items: [stoneView])
        itemBehavior.density = 0.1
        itemBehavior.elasticity = 0.3
        itemBehavior.resistance = 5
        itemBehavior.friction = 0
        itemBehavior.allowsRotation = false
        return itemBehavior
    }()
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view.frame = CGRect(
            origin: CGPoint(x: Style.StoneView.xPosition, y: Style.StoneView.yPosition),
            size: CGSize(width: Style.StoneView.containerWidth, height: Style.StoneView.containerHeight))
        
        stoneView.frame = CGRect(
            origin: CGPoint(x: Style.StoneView.xPosition, y: Style.StoneView.yPosition),
            size: CGSize(width: Style.StoneView.imageWidth, height: Style.StoneView.imageHeight))
        
        let imageView = Weather.sharedInstance().stoneImageView
        imageView.frame = stoneView.bounds
        stoneView.addSubview(imageView)
        view.addSubview(stoneView)
        
        stoneView.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        stoneView.addGestureRecognizer(panGesture)
        
        dynamicAnimator.updateItem(usingCurrentState: stoneView)
        dynamicAnimator.addBehavior(gravity)
        dynamicAnimator.addBehavior(collision)
        dynamicAnimator.addBehavior(itemBehavior)
        
        imageView.accessibilityIdentifier = Constant.Identifier.stoneImageView
        view.accessibilityIdentifier = Constant.Identifier.stoneView
    }

    // MARK: - Methods
    @objc private func handlePanGesture(sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        
        // Pull direction only down
        guard velocity.y > 0 else { return }
        
        MainViewController().postNotificationStateChangedToUpdating()
        
        switch sender.state {
            case .began:
                self.attachment.anchorPoint = location
                self.dynamicAnimator.addBehavior(self.attachment)
            case .changed:
                self.attachment.anchorPoint = location
            case .cancelled, .ended, .failed, .possible:
                self.itemBehavior.addLinearVelocity(velocity, for: self.stoneView)
                self.dynamicAnimator.removeBehavior(self.attachment)
            default: break
        }
    }
}
