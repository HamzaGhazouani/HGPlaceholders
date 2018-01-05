//
//  PlaceholdersProvider.swift
//  HGPlaceholders
//
//  Created by Hamza Ghazouani on 20/07/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import HGPlaceholders

extension PlaceholdersProvider {
    static var summer: PlaceholdersProvider {
        var commonStyle = PlaceholderStyle()
        commonStyle.backgroundColor = UIColor(red: 1.0, green: 236.0/255, blue: 209.0/255.0, alpha: 1.0)
        commonStyle.actionBackgroundColor = .black
        commonStyle.actionTitleColor = .white
        commonStyle.titleColor = .black
        commonStyle.isAnimated = false
        
        commonStyle.titleFont = UIFont(name: "AvenirNextCondensed-HeavyItalic", size: 19)!
        commonStyle.subtitleFont = UIFont(name: "AvenirNextCondensed-Italic", size: 19)!
        commonStyle.actionTitleFont = UIFont(name: "AvenirNextCondensed-Heavy", size: 19)!
        
        var loadingStyle = commonStyle
        loadingStyle.actionBackgroundColor = .clear
        loadingStyle.actionTitleColor = .gray
        
        var loadingData: PlaceholderData = .loading
        loadingData.image = #imageLiteral(resourceName: "summer-hat")
        let loading = Placeholder(data: loadingData, style: loadingStyle, key: .loadingKey)
        
        var errorData: PlaceholderData = .error
        errorData.image = #imageLiteral(resourceName: "summer-ball")
        let error = Placeholder(data: errorData, style: commonStyle, key: .errorKey)
        
        var noResultsData: PlaceholderData = .noResults
        noResultsData.image = #imageLiteral(resourceName: "summer-cocktail")
        let noResults = Placeholder(data: noResultsData, style: commonStyle, key: .noResultsKey)
        
        var noConnectionData: PlaceholderData = .noConnection
        noConnectionData.image = #imageLiteral(resourceName: "summer-beach-slippers")
        let noConnection = Placeholder(data: noConnectionData, style: commonStyle, key: .noConnectionKey)
        
        let placeholdersProvider = PlaceholdersProvider(loading: loading, error: error, noResults: noResults, noConnection: noConnection)
        
        let xibPlaceholder = Placeholder(cellIdentifier: "CustomPlaceholderCell", key: PlaceholderKey.custom(key: "XIB"))
        
        placeholdersProvider.add(placeholders: PlaceholdersProvider.starWarsPlaceholder, xibPlaceholder)
        
        return placeholdersProvider
    }
    
    private static var starWarsPlaceholder: Placeholder {
        var starwarsStyle = PlaceholderStyle()
        starwarsStyle.backgroundColor = .black
        starwarsStyle.actionBackgroundColor = .clear
        starwarsStyle.actionTitleColor = .white
        starwarsStyle.titleColor = .white
        starwarsStyle.isAnimated = false
        
        var starwarsData = PlaceholderData()
        starwarsData.title = NSLocalizedString("\"This is a new day, a\nnew beginning\"", comment: "")
        starwarsData.subtitle = NSLocalizedString("Star Wars", comment: "")
        starwarsData.image = #imageLiteral(resourceName: "star_wars")
        starwarsData.action = NSLocalizedString("OK!", comment: "")
        
        let placeholder = Placeholder(data: starwarsData, style: starwarsStyle, key: PlaceholderKey.custom(key: "starWars"))
        
        return placeholder
    }
}
