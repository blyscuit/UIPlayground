//
//  SearchHomeViewController.swift
//  UIPlayground
//
//  Created by Pisit W on 20/2/2563 BE.
//  Copyright © 2563 23. All rights reserved.
//

import UIKit

class SearchHomeViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Search"
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        let searchResultVC = storyboard.instantiateViewController(identifier: "searchResult")
        
        let searchController = UISearchController(searchResultsController: searchResultVC)
        searchController.searchBar.scopeButtonTitles = ["All", "Some"]

        // Place the search bar in the navigation bar.
        navigationItem.searchController = searchController
        
        if navigationController?.children.count ?? 0 < 2 {
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(close(_:)))
        }
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
