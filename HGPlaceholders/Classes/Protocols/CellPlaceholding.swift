//
//  Placeholdering.swift
//  Pods
//
//  Created by Hamza Ghazouani on 25/07/2017.
//
//

import UIKit

protocol CellPlaceholding {
    
    var titleLabel: UILabel? { get set }
    var subtitleLabel: UILabel? { get set }
    var placeholderImageView: UIImageView? { get set }
    var actionButton: UIButton? { get set }
    var activityIndicator: UIActivityIndicatorView? { get set }
    
    var cellView: UIView { get }
    
    
    // MARK: fill cell to selected style
    
    ///  Changes the cell style to match placeholder style
    ///
    /// - Parameters:
    ///   - style: the style to apply
    ///   - tintColor: the tint color, is used for some items when the style color is nil
    func apply(style: PlaceholderStyle, tintColor: UIColor?)
    
    ///  Sets in the cell the placeholder texts, image, ...
    ///
    /// - Parameter data: the data of the cell (texts, images, etc)
    func apply(data: PlaceholderData)
}


// MARK: default implementation
extension CellPlaceholding {
    
    
    ///  Changes the cell style to match placeholder style
    ///
    /// - Parameters:
    ///   - style: the style to apply
    ///   - tintColor: the tint color, is used for some items when the style color is nil
    internal func apply(style: PlaceholderStyle, tintColor: UIColor?) {
        cellView.backgroundColor = style.backgroundColor ?? .clear
        
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
