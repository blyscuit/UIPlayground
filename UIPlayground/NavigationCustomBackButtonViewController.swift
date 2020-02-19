//
//  NavigationCustomBackButtonViewController.swift
//  UIPlayground
//
//  Created by Pisit W on 17/2/2563 BE.
//  Copyright © 2563 23. All rights reserved.
//

import UIKit

class CustomBackButtonNavController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // For Back button customization, setup the custom image for UINavigationBar inside CustomBackButtonNavController.
        
    }
    
    func moveButtonTitle(x: Float, y: Float) {
//        UIBarButtonItem.appearance(whenContainedInInstancesOf: [CustomBackButtonNavController.self]).setBackButtonTitlePositionAdjustment(UIOffset(horizontal: CGFloat(((x * 2.0) - 1) * 10), vertical: CGFloat(((y * 2.0) - 1) * 10)), for: UIBarMetrics.default)
//        navigationItem.backBarButtonItem?.setTitlePositionAdjustment(UIOffset(horizontal: CGFloat(((x * 2.0) - 1) * 10), vertical: CGFloat(((y * 2.0) - 1) * 10)), for: .default)
    }
}

class NavigationCustomBackButtonViewController: ViewController {
    @IBOutlet weak var sliderY: UISlider!
    @IBOutlet weak var sliderX: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        sliderX.addTarget(self, action: #selector(slider1Move(_:)), for: .valueChanged)
        sliderY.addTarget(self, action: #selector(slider1Move(_:)), for: .valueChanged)
    }
    
    @IBAction func slider1Move(_ sender: Any) {
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [CustomBackButtonNavController.self]).setBackButtonTitlePositionAdjustment(UIOffset(horizontal: CGFloat(((sliderX.value * 2.0) - 1) * 10), vertical: CGFloat(((sliderY.value * 2.0) - 1) * 10)), for: UIBarMetrics.default)
        
        let backBarButtton = UIBarButtonItem(title: "Edited Back", style: .plain, target: nil, action: nil)
        backBarButtton.setBackButtonTitlePositionAdjustment(UIOffset(horizontal: CGFloat(((sliderX.value * 2.0) - 1) * 10), vertical: CGFloat(((sliderY.value * 2.0) - 1) * 10)), for: .default)
        backBarButtton.setTitlePositionAdjustment(UIOffset(horizontal: CGFloat(((sliderX.value * 2.0) - 1) * 10), vertical: CGFloat(((sliderY.value * 2.0) - 1) * 10)), for: .default)
        
        if self.navigationController?.children.count ?? 1 < 2 { return }
        
        self.navigationController?.children[(self.navigationController?.children.count ?? 0) - 2].navigationItem.backBarButtonItem = backBarButtton
    }

}
