//
//  ViewController.swift
//  Animation
//
import UIKit

class ViewController: UIViewController {

    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Set up the label
        label.text = "TBC IT Academy"
        label.sizeToFit()
        label.textColor = .red
        label.center = view.center
        view.addSubview(label)

        // Call the function to start the animation
        startAnimation()
    }

    func startAnimation() {
        // Set up the animation
        let animation = CAKeyframeAnimation(keyPath: "position")

        // Define the path the label will follow
        let path = UIBezierPath()
        path.move(to: label.center)
        path.addLine(to: CGPoint(x: label.center.x, y: label.center.y - 50)) // Adjust the distance as needed
        path.addLine(to: label.center)

        // Set the animation properties
        animation.path = path.cgPath
        animation.duration = 5.0
        animation.repeatCount = .infinity

        // Apply glitter effect during the animation
        let glitterEffect = CABasicAnimation(keyPath: "opacity")
        glitterEffect.fromValue = 1.0
        glitterEffect.toValue = 0.0
        glitterEffect.duration = 3.0
        glitterEffect.repeatCount = .infinity
        glitterEffect.autoreverses = true

        // Add the glitter effect to the label's layer
        label.layer.add(glitterEffect, forKey: "glitterEffect")

        // Combine the position animation with the glitter effect
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [animation]
        groupAnimation.duration = 10.0
        groupAnimation.repeatCount = .infinity

        // Add the animation to the label's layer
        label.layer.add(groupAnimation, forKey: "moveAndGlitter")
    }
}

