//
//  StatusBarViewController.swift
//  UIPlayground
//
//  Created by Pisit W on 21/2/2563 BE.
//  Copyright © 2563 23. All rights reserved.
//

import UIKit

class StatusBarViewController: ViewController {

    @IBOutlet weak var segment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.setBackgroundImage( UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        segment.addTarget(self, action: #selector(switched), for: .valueChanged)
    }
    
    @IBAction func switched() {
        UIApplication.shared.setStatusBarStyle(segment.selectedSegmentIndex == 1 ? .lightContent : .darkContent, animated: true)
        UIApplication.shared.setStatusBarHidden(segment.selectedSegmentIndex == 2, with: .fade)
        UIView.animate(withDuration: 0.3) {
            if self.segment.selectedSegmentIndex != 2 {
                self.view.backgroundColor = self.segment.selectedSegmentIndex == 0 ? .white : .systemGray
            }
        }
    }

}
