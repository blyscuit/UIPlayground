//
//  NavigationSizeViewController.swift
//  UIPlayground
//
//  Created by Pisit W on 18/2/2563 BE.
//  Copyright © 2563 23. All rights reserved.
//

import UIKit

class CustomNavigationViewController: UINavigationController {
    var gradientView = UIView()
    var gradientHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = GradientView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.endColor = UIColor.white
        view.startColor = UIColor(red:0.00, green:0.15, blue:0.79, alpha:1.0)
        self.view.insertSubview(view, belowSubview: navigationBar)
        gradientHeight = view.heightAnchor.constraint(equalToConstant: 100)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 0),
            view.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
            view.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0),
            gradientHeight
        ])
        
        gradientView = view
        resizeBar(height: 50)
    }
    
    func resizeBar(height: CGFloat) {
        gradientHeight.constant = height
    }
}

class NavigationSizeViewController: ViewController {
    @IBOutlet weak var sliderY: UISlider!
    @IBOutlet weak var shadowSwitch: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        sliderY.addTarget(self, action: #selector(slider1Move(_:)), for: .valueChanged)
        shadowSwitch.addTarget(self, action: #selector(toggleShadow(_:)), for: .valueChanged)

        title = "Custom Nav"
    }
    
    @IBAction func slider1Move(_ sender: Any) {
        let height: CGFloat = CGFloat(((sliderY.value * 1.0)) * 200) //whatever height you want to add to the existing height
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: height)
        (self.navigationController as? CustomNavigationViewController)?.resizeBar(height: height)
    }
    
    @IBAction func toggleShadow(_ sender: Any) {
        self.navigationController?.navigationBar.setBackgroundImage(shadowSwitch.selectedSegmentIndex == 2 ? UIImage() : nil, for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = shadowSwitch.selectedSegmentIndex == 0 ? nil : UIImage()
    }
}

@IBDesignable
class GradientView: UIView {

    @IBInspectable var startColor:   UIColor = .black { didSet { updateColors() }}
    @IBInspectable var endColor:     UIColor = .white { didSet { updateColors() }}
    @IBInspectable var startLocation: Double =   0.05 { didSet { updateLocations() }}
    @IBInspectable var endLocation:   Double =   0.95 { didSet { updateLocations() }}
    @IBInspectable var horizontalMode:  Bool =  false { didSet { updatePoints() }}
    @IBInspectable var diagonalMode:    Bool =  false { didSet { updatePoints() }}

    override public class var layerClass: AnyClass { CAGradientLayer.self }

    var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }

    func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? .init(x: 1, y: 0) : .init(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? .init(x: 0, y: 1) : .init(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? .init(x: 0, y: 0) : .init(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? .init(x: 1, y: 1) : .init(x: 0.5, y: 1)
        }
    }
    func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
    func updateColors() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }
    override public func layoutSubviews() {
        super.layoutSubviews()
        updatePoints()
        updateLocations()
        updateColors()
    }
}
