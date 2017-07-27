//
//  PlaceholdersShowing.swift
//  Pods
//
//  Created by Hamza Ghazouani on 25/07/2017.
//
//

import UIKit

/// Protocol allows to switch between the different placehodlers used by CollectionView and TableView
protocol PlaceholdersShowing {
    
    var provider: PlaceholdersProvider { get }
    
    func showPlaceholder(with dataSource: PlaceholderDataSourceDelegate)
    func showLoadingPlaceholder()
    func showNoResultsPlaceholder()
    func showErrorPlaceholder()
    func showNoConnectionPlaceholder()
    func showCustomPlaceholder(with key: PlaceholderKey)
    func showDefault()
}

extension PlaceholdersShowing {
    /// Shows loading placeholder, if you call this method and placeholdersProvider does not contains loading placeholder, assertionFailure is called
    public func showLoadingPlaceholder() {
        guard let dataSource = provider.loadingDataSource() else {
            assertionFailure("Your placeholdersProvider is not configured correctly, no placeholder with key PlaceholderKey.loading found!")
            return
        }
        showPlaceholder(with: dataSource)
    }
    
    /// Shows no results placeholder, if you call this method and placeholdersProvider does not contains loading placeholder, assertionFailure is called...
    public func showNoResultsPlaceholder() {
        guard let dataSource = provider.noResultsDataSource() else {
            assertionFailure("Your placeholdersProvider is not configured correctly, no placeholder with key PlaceholderKey.noResultsKey found!")
            return
        }
        showPlaceholder(with: dataSource)
    }
    
    /// Shows error placeholder, if you call this method and placeholdersProvider does not contains error placeholder, assertionFailure is called...
    public func showErrorPlaceholder() {
        guard let dataSource = provider.errorDataSource() else {
            assertionFailure("Your placeholdersProvider is not configured correctly, no placeholder with key PlaceholderKey.errorKey found!")
            return
        }
        showPlaceholder(with: dataSource)
    }
    
    /// Shows no internet connection placeholder, if you call this method and placeholdersProvider does not contains no internet connection placeholder, assertionFailure is called
    public func showNoConnectionPlaceholder() {
        guard let dataSource = provider.noConnectionDataSource() else {
            assertionFailure("Your placeholdersProvider is not configured correctly, no placeholder with key PlaceholderKey.noConnectionKey found!")
            return
        }
        showPlaceholder(with: dataSource)
    }
    
    /// Shows a custom placeholder
    /// If you call this method and placeholdersProvider does not contains this custom placeholder, assertionFailure is called
    /// - Parameter key: the key of the custom placeholder
    public func showCustomPlaceholder(with key: PlaceholderKey) {
        guard let dataSource = provider.dataSourceAndDelegate(with: key) else {
            assertionFailure("Your placeholdersProvider is not configured correctly, no placeholder with key: \(key.value) found!")
            return
        }
        showPlaceholder(with: dataSource)
    }
}


