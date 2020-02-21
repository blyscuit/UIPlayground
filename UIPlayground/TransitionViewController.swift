//
//  TransitionViewController.swift
//  UIPlayground
//
//  Created by Pisit W on 21/2/2563 BE.
//  Copyright © 2563 23. All rights reserved.
//

import UIKit

class TransitionViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: CGFloat(Float.random(in: 0 ..< 1)), green: CGFloat(Float.random(in: 0 ..< 1)), blue: CGFloat(Float.random(in: 0 ..< 1)), alpha: 1.0)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
