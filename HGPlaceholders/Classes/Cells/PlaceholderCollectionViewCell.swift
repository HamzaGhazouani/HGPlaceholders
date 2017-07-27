//
//  PlaceholderCollectionViewCell.swift
//  Pods
//
//  Created by Hamza Ghazouani on 25/07/2017.
//
//

import UIKit

class PlaceholderCollectionViewCell: UICollectionViewCell {
    
    var onActionButtonTap: (() -> Void)?

    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var subtitleLabel: UILabel?
    @IBOutlet weak var placeholderImageView: UIImageView?
    @IBOutlet weak var actionButton: UIButton?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
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
