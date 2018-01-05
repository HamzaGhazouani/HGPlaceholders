//
//  PlaceholdersProvider.swift
//  Pods
//
//  Created by Hamza Ghazouani on 20/07/2017.
//
//

import Foundation

/// This class is responsible for generating placeholders for the table view 
/// Takes a list of Placeholders object and generate for everyone the data source and delegate 
/// A placeholder view is a table view with one cell
final public class PlaceholdersProvider {
    
    // MARK: properties
    
    /// The dictionary of placeholders data
    private var placeholdersDictionary = [PlaceholderKey: PlaceholderDataSourceDelegate]()
    
    // MARK: init methods
    
    
    /// Create and return PlaceholdersProvider object with the specified placeholder
    /// By Default, you have 4 placeholders: loading, error, no results, and no internet connection
    /// - Parameters:
    ///   - loading: the loading placeholder
    ///   - error: the placeholder to show when an error occured
    ///   - noResults: the placeholer to show when no results is avaible
    ///   - noConnection: the placeholder of no internet connection
    public init(loading: Placeholder, error: Placeholder, noResults: Placeholder, noConnection: Placeholder) {
        
        placeholdersDictionary = [
            loading.key : PlaceholderDataSourceDelegate(placeholder: loading),
            error.key: PlaceholderDataSourceDelegate(placeholder: error),
            noResults.key: PlaceholderDataSourceDelegate(placeholder: noResults),
            noConnection.key: PlaceholderDataSourceDelegate(placeholder: noConnection),
        ]
    }
    
    
    /// Create and return PlaceholdersProvider object with the specified (custom) placeholders
    ///
    /// - Parameter placeholders: the placeholders
    public init(placeholders: Placeholder...) {
        placeholders.forEach {
            placeholdersDictionary[$0.key] = PlaceholderDataSourceDelegate(placeholder: $0)
        }
    }
    
    /// Allows you to add new placeholders
    public func add(placeholders: Placeholder...) {
        placeholders.forEach {
            placeholdersDictionary[$0.key] = PlaceholderDataSourceDelegate(placeholder: $0)
        }
    }
    
    // MARK: utilities methods
    
    
    /// Returns an instance of PlaceholderDataSourceDelegate
    /// returns nil of no placeholder found with this key
    /// - Parameter key: the key of the placeholder
    /// - Returns: the PlaceholderDataSourceDelegate object with the searched key
    func dataSourceAndDelegate(with key: PlaceholderKey) -> PlaceholderDataSourceDelegate? {
        return placeholdersDictionary[key]
    }
    
    
    
    /// Returns an instance of PlaceholderDataSourceDelegate of default loading key
    /// - Returns: returns PlaceholderDataSourceDelegate instance, nil of no placeholder found with this key
    func loadingDataSource() -> PlaceholderDataSourceDelegate? {
        return dataSourceAndDelegate(with: .loadingKey)
    }
    
    /// Returns an instance of PlaceholderDataSourceDelegate of default error key
    /// - Returns: returns PlaceholderDataSourceDelegate instance, nil of no placeholder found with this key
    func errorDataSource() -> PlaceholderDataSourceDelegate? {
        return dataSourceAndDelegate(with: .errorKey)!
    }
    
    /// Returns an instance of PlaceholderDataSourceDelegate of default no results key
    /// - Returns: returns PlaceholderDataSourceDelegate instance, nil of no placeholder found with this key
    func noResultsDataSource() -> PlaceholderDataSourceDelegate? {
        return dataSourceAndDelegate(with: .noResultsKey)!
    }
    
    /// Returns an instance of PlaceholderDataSourceDelegate of default no connection key
    /// - Returns: returns PlaceholderDataSourceDelegate instance, nil of no placeholder found with this key
    func noConnectionDataSource() -> PlaceholderDataSourceDelegate? {
        return dataSourceAndDelegate(with: .noConnectionKey)
    }
}

