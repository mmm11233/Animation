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

        label.text = "TBC IT Academy"
        label.sizeToFit()
        label.textColor = .red
        label.center = view.center
        view.addSubview(label)

        startAnimation()
    }

    func startAnimation() {
        let animation = CAKeyframeAnimation(keyPath: "position")

        let path = UIBezierPath()
        path.move(to: label.center)
        path.addLine(to: CGPoint(x: label.center.x, y: label.center.y - 50))
        path.addLine(to: label.center)

        animation.path = path.cgPath
        animation.duration = 5.0
        animation.repeatCount = .infinity

        let glitterEffect = CABasicAnimation(keyPath: "opacity")
        glitterEffect.fromValue = 1.0
        glitterEffect.toValue = 0.0
        glitterEffect.duration = 3.0
        glitterEffect.repeatCount = .infinity
        glitterEffect.autoreverses = true

        label.layer.add(glitterEffect, forKey: "glitterEffect")

        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [animation]
        groupAnimation.duration = 10.0
        groupAnimation.repeatCount = .infinity

        label.layer.add(groupAnimation, forKey: "moveAndGlitter")
    }
}

