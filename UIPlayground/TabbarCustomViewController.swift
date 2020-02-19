//
//  TabbarCustomViewController.swift
//  UIPlayground
//
//  Created by Pisit W on 19/2/2563 BE.
//  Copyright © 2563 23. All rights reserved.
//

import UIKit

class TabbarCustomViewController: UIViewController {
    @IBOutlet weak var sliderX: UISlider!
    @IBOutlet weak var sliderX2: UISlider!
    
    @IBOutlet weak var sliderL: UISlider!
    @IBOutlet weak var sliderL2: UISlider!
    
    @IBOutlet weak var switc: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: -5)
        sliderX.addTarget(self, action: #selector(slider1Move(_:)), for: .valueChanged)
        sliderX2.addTarget(self, action: #selector(slider1Move(_:)), for: .valueChanged)
        sliderL.addTarget(self, action: #selector(slider2Move(_:)), for: .valueChanged)
        sliderL2.addTarget(self, action: #selector(slider2Move(_:)), for: .valueChanged)
        switc.addTarget(self, action: #selector(swit(_:)), for: .valueChanged)
    }

    @IBAction func slider1Move(_ sender: Any) {
        self.tabBarItem.imageInsets = UIEdgeInsets(top: CGFloat(((sliderX.value * 2.0) - 1) * 10), left: CGFloat(((sliderX2.value * 2.0) - 1) * 10), bottom: CGFloat(((sliderX.value * 2.0) - 1) * -10), right: CGFloat(((sliderX2.value * 2.0) - 1) * -10))
        
    }

    @IBAction func slider2Move(_ sender: Any) {
        self.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: CGFloat(((sliderL2.value * 2.0) - 1) * 10), vertical: CGFloat(((sliderL.value * 2.0) - 1) * 10))
    }

    @IBAction func swit(_ sender: Any) {
        let shadow = switc.selectedSegmentIndex == 0 ? nil : UIImage()
        let background = switc.selectedSegmentIndex == 2 ? UIImage() : nil
        if #available(iOS 13, *) {
            let appearance = tabBarController!.tabBar.standardAppearance.copy()
            appearance.backgroundImage = background
            appearance.shadowImage = shadow
            appearance.shadowColor = .clear
            appearance.backgroundColor = switc.selectedSegmentIndex == 2 ? UIColor.white : .clear
            tabBarController?.tabBar.standardAppearance = appearance
        } else {
            tabBarController?.tabBar.backgroundImage = background
            tabBarController?.tabBar.shadowImage = shadow
        }
        self.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 0)

    }
}
