//
//  NavigationBarMoveViewController.swift
//  UIPlayground
//
//  Created by Pisit W on 17/2/2563 BE.
//  Copyright © 2563 23. All rights reserved.
//

import UIKit

class NavigationBarMoveViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Move This"
        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        backBarButtton.customView?.backgroundColor = .systemBlue
        navigationItem.backBarButtonItem = backBarButtton
    }

    @IBAction func slider1Move(_ sender: Any) {
        navigationController?.navigationBar.setTitleVerticalPositionAdjustment(CGFloat(((slider.value * 2.0) - 1) * 10), for: .default)
        
    }
}
