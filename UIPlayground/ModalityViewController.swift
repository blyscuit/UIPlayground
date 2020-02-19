//
//  ModalityViewController.swift
//  UIPlayground
//
//  Created by Pisit W on 19/2/2563 BE.
//  Copyright © 2563 23. All rights reserved.
//

import UIKit

class ModalityViewController: ViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func openAlert() {
//        performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
    }
    @IBAction func openPopover() {
        performSegue(withIdentifier: "popover", sender: self)
    }
    @IBAction func openModal() {
        performSegue(withIdentifier: "modal", sender: self)
    }
}
