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
    
    /// The color of the placeholder title
    public var titleColor: UIColor?
    /// The color of the placeholder subtitle
    public var subtitleColor: UIColor?
    
    /// The color of the action button title of the placeholder
    public var actionTitleColor: UIColor?
    /// The color of the action button background of the placeholder
    public var actionBackgroundColor: UIColor?
    
    /// The color of activity indicator view of the placeholder
    public var activityIndicatorColor: UIColor?
    
    /// The background color of the placeholder
    public var backgroundColor: UIColor?
    
    /// Should display the placeholder with animation or not
    public var isAnimated = true
    
    // MARK: init methods
    
    /// Create and return a PlaceholderStyle object
    public init() {}
}
