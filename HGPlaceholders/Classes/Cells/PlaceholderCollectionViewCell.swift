//
//  PlaceholderCollectionViewCell.swift
//  Pods
//
//  Created by Hamza Ghazouani on 25/07/2017.
//
//

import UIKit

/// The default cell used for collection view placeholders (takes the size of the collection view)
open class PlaceholderCollectionViewCell: UICollectionViewCell {
    
    var onActionButtonTap: (() -> Void)?

    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var subtitleLabel: UILabel?
    @IBOutlet weak var placeholderImageView: UIImageView?
    @IBOutlet weak var actionButton: UIButton?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    
     var cellView: UIView {
        return self
    }
    
    //  MARK: - User interaction
    
    @IBAction func sendPlaceholderAction(_ sender: Any) {
        onActionButtonTap?()
        print("Placeholder action button tapped")
    }
}

extension PlaceholderCollectionViewCell: Reusable {}
extension PlaceholderCollectionViewCell: NibLoadable {}
extension PlaceholderCollectionViewCell: CellPlaceholding {}
