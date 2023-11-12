//
//  newViewController.swift
//  Animation
//
//  Created by Mariam Joglidze on 12.11.23.
//
import UIKit

class SecondViewController: UIViewController {
    
    let gradient = CAGradientLayer()
    var gradientSet = [[CGColor]]()
    var currentGradient: Int = 0
    
    let gradientOne = UIColor(red: 48/255, green: 62/255, blue: 103/255, alpha: 1).cgColor
    let gradientTwo = UIColor(red: 244/255, green: 88/255, blue: 53/255, alpha: 1).cgColor
    let gradientThree = UIColor(red: 196/255, green: 70/255, blue: 107/255, alpha: 1).cgColor
    
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        gradientSet.append([gradientOne, gradientTwo])
        gradientSet.append([gradientTwo, gradientThree])
        gradientSet.append([gradientThree, gradientOne])
        
        gradient.frame = self.view.bounds
        gradient.colors = gradientSet[currentGradient]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.drawsAsynchronously = true
        self.view.layer.addSublayer(gradient)
        
        label.text = "TBC IT Academy"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.sizeToFit()
        label.center = self.view.center
        label.alpha = 0
        self.view.addSubview(label)
        
        UIView.animate(withDuration: 1.0, delay: 1.0, options: .curveEaseIn, animations: {
            self.label.alpha = 1.0
        }, completion: { _ in
            self.moveLabel()
        })
        
        animateGradient()
    }
    
    func moveLabel() {
        UIView.animate(withDuration: 4.0, delay: 0, options: [.autoreverse, .repeat], animations: {
            self.label.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }, completion: nil)
    }
    
    func animateGradient() {
        if currentGradient < gradientSet.count - 1 {
            currentGradient += 1
        } else {
            currentGradient = 0
        }
        
        let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
        gradientChangeAnimation.duration = 5.0
        gradientChangeAnimation.toValue = gradientSet[currentGradient]
        gradientChangeAnimation.fillMode = CAMediaTimingFillMode.forwards
        gradientChangeAnimation.isRemovedOnCompletion = false
        gradient.add(gradientChangeAnimation, forKey: "colorChange")
    }
}
