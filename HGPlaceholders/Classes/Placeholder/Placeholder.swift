//
//  Placeholder.swift
//  Pods
//
//  Created by Hamza Ghazouani on 20/07/2017.
//
//

import Foundation
import UIKit

/// The Placeholder object, is used to create placeholders
public struct Placeholder {
    
    /// The data of the placeholer
    public var data: PlaceholderData?
    /// The style of the placeholder
    public var style: PlaceholderStyle?
    
    /// The cell identifier of the placeholder
    public let cellIdentifier: String?
    
    /// The key of the placeholder, each placeholder should have an unique key
    public let key: PlaceholderKey
    
    
    /// Create a placeholder by using the data and style objects
    ///
    /// - Parameters:
    ///   - data: the data of the placeholder
    ///   - style: the style of the placeholder
    ///   - key: the unique key of the placeholder
    public init(data: PlaceholderData, style: PlaceholderStyle, key: PlaceholderKey) {
        self.key = key
        self.style = style
        self.data = data
        
        self.cellIdentifier = nil
    }
    
    
    /// Create a placeholder by using custom xib file
    ///
    /// - Parameters:
    ///   - cellIdentifier: The identifier of the cell to use as a placeholder
    ///   - key: the unique key of the placeholder
    public init(cellIdentifier: String, key: PlaceholderKey) {
        self.key = key
        self.cellIdentifier = cellIdentifier
    }
}
