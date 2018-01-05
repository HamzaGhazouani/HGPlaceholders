//
//  TableView+Switcher.swift
//  Pods
//
//  Created by Hamza Ghazouani on 29/09/2017.
//
//

import UIKit

// MARK: Utilities methods to switch to placeholders
extension TableView: PlaceholdersSwitcher {
    
    public func showLoadingPlaceholder() {
        guard let dataSource = placeholdersProvider.loadingDataSource() else {
            assertionFailure(ErrorText.loadingPlaceholder.text)
            return
        }
        self.switchTo(dataSource: dataSource, delegate: dataSource)
    }
    
    public func showNoResultsPlaceholder() {
        guard let dataSource = placeholdersProvider.noResultsDataSource() else {
            assertionFailure(ErrorText.noResultPlaceholder.text)
            return
        }
        self.switchTo(dataSource: dataSource, delegate: dataSource)
    }
    
    public func showErrorPlaceholder() {
        guard let dataSource = placeholdersProvider.errorDataSource() else {
            assertionFailure(ErrorText.errorPlaceholder.text)
            return
        }
        self.switchTo(dataSource: dataSource, delegate: dataSource)
    }
    
    public func showNoConnectionPlaceholder() {
        guard let dataSource = placeholdersProvider.noConnectionDataSource() else {
            assertionFailure(ErrorText.noConnectionPlaceholder.text)
            return
        }
        self.switchTo(dataSource: dataSource, delegate: dataSource)
    }
    
    public func showCustomPlaceholder(with key: PlaceholderKey) {
        guard let dataSource = placeholdersProvider.dataSourceAndDelegate(with: key) else {
            assertionFailure(ErrorText.customPlaceholder(key: key.value).text)
            return
        }
        self.switchTo(dataSource: dataSource, delegate: dataSource)
    }
    
    public func showDefault() {
        self.switchTo(dataSource: defaultDataSource, delegate: defaultDelegate)
    }
    
}
