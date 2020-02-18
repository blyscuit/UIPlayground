//
//  NavigationCustomBackButtonViewController.swift
//  UIPlayground
//
//  Created by Pisit W on 17/2/2563 BE.
//  Copyright © 2563 23. All rights reserved.
//

import UIKit

class CustomBackButtonNavController: UINavigationController {
}

class NavigationCustomBackButtonViewController: UIViewController {
    @IBOutlet weak var sliderY: UISlider!
    @IBOutlet weak var sliderX: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        sliderX.addTarget(self, action: #selector(slider1Move(_:)), for: .valueChanged)
        sliderY.addTarget(self, action: #selector(slider1Move(_:)), for: .valueChanged)
    }
    
    @IBAction func slider1Move(_ sender: Any) {
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [CustomBackButtonNavController.self]).setBackButtonTitlePositionAdjustment(UIOffset(horizontal: CGFloat(((sliderX.value * 2.0) - 1) * 10), vertical: CGFloat(((sliderY.value * 2.0) - 1) * 10)), for: .default)
        navigationController?.view.layoutSubviews()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        

        // For Back button customization, setup the custom image for UINavigationBar inside CustomBackButtonNavController.
        let backButtonBackgroundImage = UIImage(systemName: "list.bullet")
        let barAppearance =
            UINavigationBar.appearance(whenContainedInInstancesOf: [CustomBackButtonNavController.self])
        barAppearance.backIndicatorImage = backButtonBackgroundImage
        barAppearance.backIndicatorTransitionMaskImage = backButtonBackgroundImage

        
    }

}
