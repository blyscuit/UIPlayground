//
//  NavigationLargeTitleViewController.swift
//  UIPlayground
//
//  Created by Pisit W on 20/2/2563 BE.
//  Copyright © 2563 23. All rights reserved.
//

import UIKit

class NavigationLargeTitleViewController: ViewController {
    @IBOutlet weak var sliderY: UISlider!
    @IBOutlet weak var shadowSwitch: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.barTintColor = UIColor.systemBlue

        title = "Large Title"

        sliderY.addTarget(self, action: #selector(slided), for: .valueChanged)
    }
    
    @IBAction func slided() {
        let attrs = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: CGFloat((self.sliderY.value * 30) + 12))
        ]

        self.navigationController?.navigationBar.largeTitleTextAttributes = attrs
        
        UINavigationBar.appearance().titleTextAttributes = attrs
    }
    
}
