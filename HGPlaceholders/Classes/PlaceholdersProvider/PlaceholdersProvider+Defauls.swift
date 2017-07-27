//
//  PlaceholdersProvider+Defauls.swift
//  Pods
//
//  Created by Hamza Ghazouani on 20/07/2017.
//
//

import Foundation

extension PlaceholdersProvider {
    
    /// The default2 provider has the same placeholders as default, but with different images
    public static var default2: PlaceholdersProvider {
        let style = PlaceholderStyle()
        
        var loading = Placeholder(data: .loading, style: style, key: .loadingKey)
        loading.data?.image = PlaceholdersProvider.image(named: "hg_default2-loading")
        
        var error = Placeholder(data: .error, style: style, key: .errorKey)
        error.data?.image = PlaceholdersProvider.image(named: "hg_default2-error")
        
        var noResults = Placeholder(data: .noResults, style: style, key: .noResultsKey)
        noResults.data?.image =  PlaceholdersProvider.image(named: "hg_default2-no_results")
        
        var noConnection = Placeholder(data: .noConnection, style: style, key: .noConnectionKey)
        noConnection.data?.image = PlaceholdersProvider.image(named: "hg_default2-error")
        
        let placeholdersProvider = PlaceholdersProvider(loading: loading, error: error, noResults: noResults, noConnection: noConnection)
        
        return placeholdersProvider
    }
    
    /// The default provider has 4 placeholders: loading, error, noResults, and no internet conntection
    public static var `default`: PlaceholdersProvider {
        let style = PlaceholderStyle()
        
        let loading = Placeholder(data: .loading, style: style, key: .loadingKey)
        let error = Placeholder(data: .error, style: style, key: .errorKey)
        let noResults = Placeholder(data: .noResults, style: style, key: .noResultsKey)
        let noConnection = Placeholder(data: .noConnection, style: style, key: .noConnectionKey)
        
        let placeholdersProvider = PlaceholdersProvider(loading: loading, error: error, noResults: noResults, noConnection: noConnection)
        return placeholdersProvider
    }
    
    /// The basic provider has the same placeholders as default, but without any images
    public static var basic: PlaceholdersProvider {
        let style = PlaceholderStyle()
        
        var loading = Placeholder(data: .loading, style: style, key: .loadingKey)
        loading.data?.image = nil
        
        var error = Placeholder(data: .error, style: style, key: .errorKey)
        error.data?.image = nil
        
        var noResults = Placeholder(data: .noResults, style: style, key: .noResultsKey)
        noResults.data?.image = nil
        
        var noConnection = Placeholder(data: .noConnection, style: style, key: .noConnectionKey)
        noConnection.data?.image = nil
        
        let placeholdersProvider = PlaceholdersProvider(loading: loading, error: error,
                                                        noResults: noResults, noConnection: noConnection)
        return placeholdersProvider
    }
    
    /// The halloween provider has the same placeholders as default, but with different images and style (for fun :))
    public static var halloween: PlaceholdersProvider {
        
        var commonStyle = PlaceholderStyle()
        commonStyle.backgroundColor = HGColor.violet
        commonStyle.actionBackgroundColor = .black
        commonStyle.actionTitleColor = HGColor.violet
        commonStyle.isAnimated = false
        
        var loadingStyle = commonStyle
        loadingStyle.actionBackgroundColor = .clear
        loadingStyle.actionTitleColor = .gray
        
        var loadingData: PlaceholderData = .loading
        loadingData.image = PlaceholdersProvider.image(named:"halloween-loading")
        let loading = Placeholder(data: loadingData, style: loadingStyle, key: .loadingKey)
        
        var errorData: PlaceholderData = .error
        errorData.image = PlaceholdersProvider.image(named:"halloween-error")
        let error = Placeholder(data: errorData, style: commonStyle, key: .errorKey)
        
        var noResultsData: PlaceholderData = .noResults
        noResultsData.image = PlaceholdersProvider.image(named:"halloween-no_results")
        let noResults = Placeholder(data: noResultsData, style: commonStyle, key: .noResultsKey)
        
        var noConnectionData: PlaceholderData = .noConnection
        noConnectionData.image = PlaceholdersProvider.image(named:"halloween-no_network")
        let noConnection = Placeholder(data: noConnectionData, style: commonStyle, key: .noConnectionKey)
        
        let placeholdersProvider = PlaceholdersProvider(loading: loading, error: error, noResults: noResults, noConnection: noConnection)
        
        return placeholdersProvider
    }
}

// MARK: images Utilities
extension PlaceholdersProvider {
    
    static func image(named name: String) -> UIImage? {
        let image = UIImage(named: name) ?? UIImage(named: name, in: Bundle(for: self), compatibleWith: nil)
        
        return image
    }
}

struct HGColor {
    static let violet = UIColor(red: 250.0/255.0, green: 222.0/255.0, blue: 251.0/255.0, alpha: 1.0)
}
