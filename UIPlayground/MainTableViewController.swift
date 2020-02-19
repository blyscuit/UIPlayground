//
//  MainTableViewController.swift
//  UIPlayground
//
//  Created by Pisit W on 19/2/2563 BE.
//  Copyright © 2563 23. All rights reserved.
//

import UIKit

enum MainMenu {
    case nav, tab, modality
    static var all = [MainMenu.nav, MainMenu.tab, MainMenu.modality]
    func title() -> String {
        switch self {
        case .nav :
            return "Navigation Bar"
        case .tab:
            return "Tab Bar"
        case .modality:
            return "Modality"
        }
    }
    func segue() -> String {
        switch self {
        case .nav :
            return "nav"
        case .tab:
            return "tab"
        case .modality:
            return "modal"
        }
    }
}

class MainTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var sections = MainMenu.all
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension MainTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: sections[indexPath.row].segue(), sender: self)
    }
}

extension MainTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = sections[indexPath.row].title()
        return cell
    }
    
    
}
