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
        
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Some Title", message: "Enter a text", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = "Some default text"
        }

        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            print("Text field: \(textField.text)")
        }))
        alert.addAction(UIAlertAction(title: "destructive", style: .destructive, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            print("Text field: \(textField.text)")
        }))
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            print("Text field: \(textField.text)")
        }))

        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func openPopover() {
        performSegue(withIdentifier: "popover", sender: self)
    }
    @IBAction func openModal() {
        performSegue(withIdentifier: "modal", sender: self)
    }
    @IBAction func openActionSheet() {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Some Title", message: "Enter a text", preferredStyle: .actionSheet)

        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "default", style: .default, handler: { [weak alert] (_) in
        }))
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: { [weak alert] (_) in
        }))
        alert.addAction(UIAlertAction(title: "destructive", style: .destructive, handler: { [weak alert] (_) in
        }))

        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension ModalityViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "popover" {
            let popoverViewController = segue.destination 
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.popover
            popoverViewController.popoverPresentationController!.delegate = self
        }
    }
}

extension ModalityViewController: UIActionSheetDelegate {
    
}
