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
    
    
    /// Create and return a Placeholder object with the specified identifier, data, style, and key
    ///
    /// - Parameters:
    ///   - cellIdentifier: the identifier of the cell to use as a placeholder, set it only if you want to add a custom placeholder
    ///   - data: the data of the placeholder s
    ///   - style: the style of the placeholder
    ///   - key: the unique key of the placeholder
    public init(cellIdentifier: String? = nil, data: PlaceholderData? = nil, style: PlaceholderStyle? = nil, key: PlaceholderKey) {
        self.key = key
        self.cellIdentifier = cellIdentifier
        self.style = style
        self.data = data
    }
}
