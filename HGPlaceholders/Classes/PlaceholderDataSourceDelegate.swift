//
//  PlaceholderDataSourceDelegate.swift
//  Pods
//
//  Created by Hamza Ghazouani on 20/07/2017.
//
//

import Foundation

/// This class is responsible for implementing the `UITableViewDataSource` and `UITableViewDelegate` protocols.
/// Each placeholder view is an tableview with one cell, that takes all the tableview frame
class PlaceholderDataSourceDelegate: NSObject {
    
    // MARK: properties
    
    /// The placeholder object
    let placeholder: Placeholder
    
    // MARK: init methods

    /// Create and return a PlaceholderDataSourceDelegate object with the specified Placeholder
    ///
    /// - Parameter placeholder: the placeholder object
    init(placeholder: Placeholder) {
        self.placeholder = placeholder
    }
}

// MARK: table view data source methods


/**
 * The placeholder template data source, adopt the UITableViewDataSource protocol
 */
extension PlaceholderDataSourceDelegate: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: placeholder.cellIdentifier)!
        guard let PlaceholderTableViewCell = (cell as? PlaceholderTableViewCell) else {
            print("HGTableView: the cell is not a TableViewCell")
            return cell
        }
        
        // apply style
        if let style = placeholder.style {
            PlaceholderTableViewCell.apply(style: style, tintColor: tableView.tintColor)
        }
        
        // apply data
        if let data = placeholder.data {
            PlaceholderTableViewCell.apply(data: data)
        }
        
        // forward action to placeholder delegate
        PlaceholderTableViewCell.onActionButtonTap = { [unowned self] in
            guard let placeholderTableView = (tableView as? TableView) else { return }
            placeholderTableView.placeholderDelegate?.tableView(placeholderTableView, actionButtonTappedFor: self.placeholder)
        }
        
        PlaceholderTableViewCell.selectionStyle = .none
        
        return cell
    }
}

/**
 * The placeholder template delegate, adopt the UITableViewDelegate protocol
 * Implement the method tableView:heightForRowAt: to much cell size to tableview size
 * And tableView:willDisplay: to animate the cell if needed
 */
extension PlaceholderDataSourceDelegate: UITableViewDelegate {
    
    // the placeholder cell takes always the size of the table view
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var height = tableView.bounds.height
        if #available(iOS 10, *) {
            height -= tableView.refreshControl?.bounds.height ?? 0
        }
        height -= (tableView.contentInset.top +  tableView.contentInset.bottom)
        return height
    }
    
    // animate the cell
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if placeholder.style?.isAnimated == false { return }
        
        // animate the imageView
        guard let PlaceholderTableViewCell = cell as? PlaceholderTableViewCell else { return }
        guard let imageView = PlaceholderTableViewCell.placeholderImageView else { return }
        let rotate = CGAffineTransform(rotationAngle: -0.2)
        let stretchAndRotate = rotate.scaledBy(x: 0.5, y: 0.5)
        imageView.transform = stretchAndRotate
        imageView.alpha = 0.5
        UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping:  0.45, initialSpringVelocity: 10.0, options:[.curveEaseOut], animations: {
            imageView.alpha = 1.0
            let rotate = CGAffineTransform(rotationAngle: 0.0)
            let stretchAndRotate = rotate.scaledBy(x: 1.0, y: 1.0)
            imageView.transform = stretchAndRotate
            
        }, completion: nil)
    }
}

