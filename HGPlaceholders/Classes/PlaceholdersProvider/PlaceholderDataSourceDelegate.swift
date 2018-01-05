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
    
    // MARK: Utilities methods 
    
    /// fill the placeholder cell to the texts and styles
    ///
    /// - Parameters:
    ///   - cell: the cell can be an UITableViewCell or UICollectionViewCell, but it must be conform to the protocol CellPlaceholding
    ///   - placeholder: the placeholder object
    ///   - tintColor: the tint color to apply
    func fill(cell: CellPlaceholding, to placeholder: Placeholder, tintColor: UIColor?) {
        
        /* if the the placeholder created by xib and data/style are nil, we should keep the xib data/style */
        
        // apply style
        if let style = placeholder.style {
            cell.apply(style: style, tintColor: tintColor)
        }
        
        // apply data
        if let data = placeholder.data {
            cell.apply(data: data)
        }
    }
    
    /// Animate the cell (UICollectionViewCell / UITableViewCell)
    ///
    /// - Parameter cell: the cell to animate, it should be conform to the protocol CellPlaholding
    func animate(cell: CellPlaceholding) {
        // animate the imageView
        
        guard let imageView = cell.placeholderImageView else { return }
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
    
    /// Returns the height of the scroll view by removing the top and bottom inset + the height of the refresh control
    ///
    /// - Parameter scrollView: the scroll view
    /// - Returns: the height of the scroll view without refresh control, top and bottom inset
    func height(of scrollView: UIScrollView) -> CGFloat {
        var height = scrollView.bounds.height
        if #available(iOS 10, *) {
            height -= scrollView.refreshControl?.bounds.height ?? 0
        }
        if #available(iOS 11, *) {
            height -= (scrollView.adjustedContentInset.top + scrollView.adjustedContentInset.bottom)
        } else {
            height -= (scrollView.contentInset.top + scrollView.contentInset.bottom)
        }
        return height
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
        let reuseIdentifier = placeholder.cellIdentifier ?? PlaceholderTableViewCell.reuseIdentifier
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) else {
            fatalError(
                "Failed to dequeue a cell with identifier \(reuseIdentifier). "
                    + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                    + "and that you registered the cell beforehand"
            )
        }
       
        cell.selectionStyle = .none
        // If the cell does not inherit from PlaceholderTableViewCell, the data and the style can't be applied
        guard let placeholderTableViewCell = cell as? PlaceholderTableViewCell else {
            return cell
        }
        
        fill(cell: placeholderTableViewCell, to: placeholder, tintColor: tableView.tintColor)
        
        // forward action to placeholder delegate
        placeholderTableViewCell.onActionButtonTap = { [unowned self] in
            guard let placeholderTableView = (tableView as? TableView) else { return }
            placeholderTableView.placeholderDelegate?.view(tableView, actionButtonTappedFor: self.placeholder)
        }
        
        return cell
    }
}

// MARK: - table view delegate methods 

/**
 * The placeholder template delegate, adopt the UITableViewDelegate protocol
 * Implement the method tableView:heightForRowAt: to much cell size to tableview size
 * And tableView:willDisplay: to animate the cell if needed
 */
extension PlaceholderDataSourceDelegate: UITableViewDelegate {
    
    // the placeholder cell takes always the size of the table view
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var tableViewHeight = height(of: tableView)
        
        // subtract tableHeaderView Height out of height
        let style = placeholder.style
        if style?.shouldShowTableViewHeader != true {
            tableViewHeight -= tableView.tableHeaderView?.bounds.height ?? 0
        }
        
        // subtract tableFooterView Height out of height
        if style?.shouldShowTableViewFooter != true {
            tableViewHeight -= tableView.tableFooterView?.bounds.height ?? 0
        }
        
        return tableViewHeight
    }
    
    // animate the cell
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if placeholder.style?.isAnimated == false {
            return
        }
        
        guard let placeholderTableViewCell = cell as? PlaceholderTableViewCell else { return }
        animate(cell: placeholderTableViewCell)
    }
}


// MARK: - collection view data source methods 

extension PlaceholderDataSourceDelegate: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier = placeholder.cellIdentifier ?? PlaceholderCollectionViewCell.reuseIdentifier
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)

        // If the cell does not inherit from PlaceholderTableViewCell, the data and the style can't be applied
        guard let placeholderCollectionViewCell = cell as? PlaceholderCollectionViewCell else {
            return cell
        }
        
        fill(cell: placeholderCollectionViewCell, to: placeholder, tintColor: collectionView.tintColor)
        
        // forward action to placeholder delegate
        placeholderCollectionViewCell.onActionButtonTap = { [unowned self] in
            guard let placeholderCollectionView = collectionView as? CollectionView else { return }
            placeholderCollectionView.placeholderDelegate?.view(collectionView, actionButtonTappedFor: self.placeholder)
        }
        return cell
    }
}

extension PlaceholderDataSourceDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewHeight = height(of: collectionView)
        return CGSize(width: collectionView.bounds.width, height: collectionViewHeight)
    }
}

