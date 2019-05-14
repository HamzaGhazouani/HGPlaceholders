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
    func apply(data: PlaceholderData?)
}


// MARK: default implementation
extension CellPlaceholding {
    
    
    ///  Changes the cell style to match placeholder style
    ///
    /// - Parameters:
    ///   - style: the style to apply
    ///   - tintColor: the tint color, is used for some items when the style color is nil
    internal func apply(style: PlaceholderStyle, tintColor: UIColor?) {
        cellView.backgroundColor = style.backgroundColor
        
        let buttonBackgroundColor = style.actionBackgroundColor ?? tintColor
        actionButton?.backgroundColor = buttonBackgroundColor
        
        let actionColor = style.actionTitleColor
        actionButton?.setTitleColor(actionColor, for: .normal)
        actionButton?.titleLabel?.font = style.actionTitleFont
        
        activityIndicator?.color = style.activityIndicatorColor
        
        titleLabel?.textColor = style.titleColor
        titleLabel?.font = style.titleFont
        titleLabel?.textAlignment = style.titleTextAlignment
        
        subtitleLabel?.textColor = style.subtitleColor
        subtitleLabel?.font = style.subtitleFont
        subtitleLabel?.textAlignment = style.subtitleTextAlignment
    }
    
    ///  Sets in the cell the placeholder texts, image, ...
    ///
    /// - Parameter data: the data of the cell (texts, images, etc)
    internal func apply(data: PlaceholderData?) {
        actionButton?.setTitle(data?.action, for: .normal)
        actionButton?.isHidden = (data?.action == nil)
        
        titleLabel?.text = data?.title
        subtitleLabel?.text = data?.subtitle
        placeholderImageView?.image = data?.image
        
        data?.showsLoading == true ? activityIndicator?.startAnimating() : activityIndicator?.stopAnimating()
    }
}
