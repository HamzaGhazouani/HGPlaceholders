//
//  PlaceholderType.swift
//  Pods
//
//  Created by Hamza Ghazouani on 20/07/2017.
//
//

import Foundation


/// Manage all keys of placeholsers, each placeholder should has an unique key
/// Struct instead of enum because here we need to extend the number of cases.
public struct PlaceholderKey: Hashable {
    
    // MARK: properties 
    
    /// The key value
    public let value: String
    
    // MARK: init methods
    
    
    /// Create and return a PlaceholderKey with the specified key value
    ///
    /// - Parameter value: the value of the key 
    private init(value: String) {
        self.value = value
    }
    
    // MARK: default keys
    
    /// The default loading key, is used for loading placeholder
    public static var loadingKey = PlaceholderKey(value: "loading")
    
    /// The default no internet connection key, is used for no internet connection placeholder
    public static var noConnectionKey = PlaceholderKey(value: "noConnection")
    
    /// The default error key, is used for error placeholder
    public static var errorKey = PlaceholderKey(value: "error")
    
    /// The default no result key, is used for no results placeholder
    public static var noResultsKey = PlaceholderKey(value: "noResults")
    
    /// Is used to add new keys
    public static func custom(key: String) -> PlaceholderKey { return PlaceholderKey(value: key) }
    
    public var hashValue: Int {
        return value.hashValue
    }
}

extension PlaceholderKey: Equatable {
    /// To make PlaceholderKey hashable 
    public static func == (lhs: PlaceholderKey, rhs: PlaceholderKey) -> Bool {
        return lhs.value == rhs.value
    }
}
