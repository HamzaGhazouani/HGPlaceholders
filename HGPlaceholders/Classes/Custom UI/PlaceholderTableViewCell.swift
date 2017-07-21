//
//  PlaceholderTableViewCell.swift
//  Pods
//
//  Created by Hamza Ghazouani on 20/07/2017.
//
//

import UIKit



/// The default cell used for table view placeholders (takes the size of the table view)
open class PlaceholderTableViewCell: UITableViewCell {
    
    // MARK: Properties 
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var subtitleLabel: UILabel?
    @IBOutlet weak var placeholderImageView: UIImageView?
    @IBOutlet weak var actionButton: UIButton?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    
    //  MARK: - User interaction
    var onActionButtonTap:(() -> Void)?
    
    @IBAction func sendPlaceholderAction(_ sender: Any) {
        onActionButtonTap?()
        print("Placeholder action button tapped")
    }
    
    // MARK: fill cell to data and style 
    
    
    ///  Changes the cell style to match placeholder style
    ///
    /// - Parameters:
    ///   - style: the style to apply
    ///   - tintColor: the tint color, is used for some items when the style color is nil
    internal func apply(style: PlaceholderStyle, tintColor: UIColor?) {
        backgroundColor = style.backgroundColor ?? .clear
        
        let buttonBackgroundColor = style.actionBackgroundColor ?? tintColor
        actionButton?.backgroundColor = buttonBackgroundColor
        
        let actionColor = style.actionTitleColor ?? .white
        actionButton?.setTitleColor(actionColor, for: .normal)
        
        activityIndicator?.color = style.activityIndicatorColor ?? .lightGray
        
        titleLabel?.textColor = style.titleColor ?? .darkText
        subtitleLabel?.textColor = style.subtitleColor ?? .gray
    }
    
    
   ///  Sets in the cell the placeholder texts, image, ... 
   ///
   /// - Parameter data: the data of the cell (texts, images, etc)
   internal func apply(data: PlaceholderData) {
        actionButton?.setTitle(data.action, for: .normal)
        actionButton?.isHidden = (data.action == nil)
        
        titleLabel?.text = data.title
        titleLabel?.isHidden = (data.title == nil)
        
        subtitleLabel?.text = data.subtitle
        subtitleLabel?.isHidden = (data.title == nil)
        
        placeholderImageView?.image = data.image
        placeholderImageView?.isHidden = (data.image == nil)
        
        data.showsLoading == true ? activityIndicator?.startAnimating() : activityIndicator?.stopAnimating()
    }
}
