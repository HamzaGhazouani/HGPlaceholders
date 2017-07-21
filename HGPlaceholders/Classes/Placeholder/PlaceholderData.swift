//
//  PlaceholderData.swift
//  Pods
//
//  Created by Hamza Ghazouani on 20/07/2017.
//
//

import UIKit

/// Contains the placeholder data: texts, image, etc 
public struct PlaceholderData {
    
    // MARK: properties
    
    /// The placeholder image, if the image is nil, the placeholder image view will be hidden
    public var image: UIImage?
    
    /// the placeholder title
    public var title: String?
    
    /// The placeholder subtitle
    public var subtitle: String?
    
    /// The placehlder action title, if the action title is nil, the placeholder action button will be hidden
    public var action: String?
    
    /// Should shows the activity indicator of the placeholder or not
    public var showsLoading = false
    
    // MARK: init methods
    
    
    /// Create and return PlaceholderData object
    public init() {}
    
    // MARK: Defaults placeholders data
    
    /// The default data (texts, image, ...) of the default no results placeholder
    public static var noResults: PlaceholderData {
        var noResultsStyle = PlaceholderData()
        noResultsStyle.image = PlaceholdersProvider.image(named: "hg_default-no_results")
        noResultsStyle.title = NSLocalizedString("No results founds", comment: "")
        noResultsStyle.subtitle = NSLocalizedString("We can’t find what\nyou’re looking for.", comment: "")
        noResultsStyle.action = NSLocalizedString("Try Again!", comment: "")
        
        return noResultsStyle
    }
    
    /// The default data (texts, image, ...) of the default loading placeholder
    public static var loading: PlaceholderData {
        var loadingStyle = PlaceholderData()
        loadingStyle.image = PlaceholdersProvider.image(named: "hg_default-loading")
        loadingStyle.title = NSLocalizedString("Loading...", comment: "")
        loadingStyle.action = NSLocalizedString("Cancel", comment: "")
        loadingStyle.subtitle = NSLocalizedString("The bits are flowing\nslowly today", comment: "")
        loadingStyle.showsLoading = true
        
        return loadingStyle
    }
    
    /// The default data (texts, image, ...) of the default error placeholder
    public static var error: PlaceholderData {
        var errorStyle = PlaceholderData()
        errorStyle.image = PlaceholdersProvider.image(named: "hg_default-error")
        errorStyle.title = NSLocalizedString("Whoops!", comment: "")
        errorStyle.subtitle = NSLocalizedString("We tried, but something went\nteriblly wrong", comment: "")
        errorStyle.action = NSLocalizedString("Try Again!", comment: "")
        
        return errorStyle
    }
    
    /// The default data (texts, image, ...) of the default no connecton placeholder
    public static var noConnection: PlaceholderData {
        var noConnectionStyle = PlaceholderData()
        noConnectionStyle.image = PlaceholdersProvider.image(named: "hg_default-no_connection")
        noConnectionStyle.title = NSLocalizedString("Whoops!", comment: "")
        noConnectionStyle.subtitle = NSLocalizedString("Slow or no internet connections.\nPlease check your internet settings", comment: "")
        noConnectionStyle.action = NSLocalizedString("Try Again!", comment: "")
        
        return noConnectionStyle
    }
}
