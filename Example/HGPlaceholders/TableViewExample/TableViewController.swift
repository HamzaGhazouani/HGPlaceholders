//
//  ViewController.swift
//  HGPlaceholders
//
//  Created by HamzaGhazouani on 07/20/2017.
//  Copyright (c) 2017 HamzaGhazouani. All rights reserved.
//

import UIKit

import HGPlaceholders

class ViewController: UITableViewController {
    
    var placeholderTableView: TableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // cell for custom placeholder
        let nib = UINib(nibName: "ExampleTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomPlaceholderCell")
                
        placeholderTableView = tableView as? TableView
        placeholderTableView?.placeholderDelegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Table view delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        switch indexPath.row {
        case 0:
            placeholderTableView?.showLoadingPlaceholder()
        case 1:
            placeholderTableView?.showNoResultsPlaceholder()
        case 2:
            placeholderTableView?.showErrorPlaceholder()
        case 3:
            placeholderTableView?.showNoConnectionPlaceholder()
        case 4:
            let key = PlaceholderKey.custom(key: "starWars")
            placeholderTableView?.showCustomPlaceholder(with: key)
        case 5:
            let key = PlaceholderKey.custom(key: "XIB")
            placeholderTableView?.showCustomPlaceholder(with: key)
            
            
        default:
            placeholderTableView?.showDefault()
        }
    }
    
    // MARK: user interaction methods
    
    @IBAction func showProviders() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let `default` = UIAlertAction(title: "Default", style: .default) { (action) in
            self.placeholderTableView?.placeholdersProvider = .default
            self.placeholderTableView?.reloadData()
        }
        
        let default2 = UIAlertAction(title: "Default2", style: .default) { (action) in
            self.placeholderTableView?.placeholdersProvider = .default2
            self.placeholderTableView?.reloadData()
        }
        
        let basic = UIAlertAction(title: "Basic", style: .default) { (action) in
            self.placeholderTableView?.placeholdersProvider = .basic
            self.placeholderTableView?.reloadData()
        }
        
        let halloween = UIAlertAction(title: "Halloween", style: .default) { (action) in
            self.placeholderTableView?.placeholdersProvider = .halloween
            self.placeholderTableView?.showDefault()
        }
        
        let custom = UIAlertAction(title: "Custom", style: .default) { (action) in
            self.placeholderTableView?.placeholdersProvider = .summer
            self.placeholderTableView?.showDefault()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            alertController.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(`default`)
        alertController.addAction(default2)
        alertController.addAction(basic)
        alertController.addAction(halloween)
        alertController.addAction(custom)
        alertController.addAction(cancel)
        
        present(alertController, animated: true, completion: nil)
    }
    
}

extension ViewController: PlaceholderDelegate {
    
    func view(_ view: Any, actionButtonTappedFor placeholder: Placeholder) {
        print(placeholder.key.value)
        placeholderTableView?.showDefault()
    }

}

class ProjectNameTableView: TableView {
    
   override func customSetup() {
        placeholdersProvider = .summer
    }

}
