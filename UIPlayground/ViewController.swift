//
//  ViewController.swift
//  UIPlayground
//
//  Created by Pisit W on 17/2/2563 BE.
//  Copyright © 2563 23. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if navigationController?.children.count ?? 0 < 2 {
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(close(_:)))
        }
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}

