//
//  PlaceholderStyle.swift
//  Pods
//
//  Created by Hamza Ghazouani on 20/07/2017.
//
//

import UIKit


/// PlaceholderStyle is used to customise the placeholder cell style
public struct PlaceholderStyle {
    
    // MARK: properties
    
    /// The color of the placeholder title, the default value is darkText
    public var titleColor: UIColor = .darkText
    /// The font of the placeholder title, the default value is boldSystemFont 19
    public var titleFont = UIFont.boldSystemFont(ofSize: 19)

    /// The color of the placeholder subtitle, the default value is gray
    public var subtitleColor: UIColor = .gray
    /// The font of the placeholder subtitle, the default value is  systemFont 14
    public var subtitleFont = UIFont.systemFont(ofSize: 14)
    
    /// The color of the action button title of the placeholder, the default value is white
    public var actionTitleColor: UIColor = .white
    /// The font of the placeholder subtitle, the default value is  boldSystemFont 17
    public var actionTitleFont = UIFont.boldSystemFont(ofSize: 17)
    
    /// The color of the action button background of the placeholder, the default value is the tint color
    public var actionBackgroundColor: UIColor?
    
    /// The color of activity indicator view of the placeholder, the default value is light gray
    public var activityIndicatorColor = UIColor.lightGray
    
    /// The background color of the placeholder, the default value is clear
    public var backgroundColor = UIColor.clear
    
    /// Should display the placeholder with animation or not
    public var isAnimated = true
    
    /// Should display the tableViewHeader or not, the default value is false
    public var shouldShowTableViewHeader = false
    
    /// Should display the tableViewFooter or not, the default value is  false
    public var shouldShowTableViewFooter = false
    
    // MARK: init methods
    
    /// Create and return a PlaceholderStyle object
    public init() {}
}
