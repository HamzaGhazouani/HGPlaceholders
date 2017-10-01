//
//  ErrorMessage.swift
//  Pods
//
//  Created by Hamza Ghazouani on 29/09/2017.
//
//

import UIKit

enum ErrorText {
    case loadingPlaceholder
    case noResultPlaceholder
    case errorPlaceholder
    case noConnectionPlaceholder
    case customPlaceholder(key: String)
    
    var text: String {
        var key: String
        switch self {
        case .loadingPlaceholder:
            key = "PlaceholderKey.loadingKey"
        case .noResultPlaceholder:
            key = "PlaceholderKey.noResultsKey"
        case .errorPlaceholder:
            key = "PlaceholderKey.errorKey"
        case .noConnectionPlaceholder:
            key = "PlaceholderKey.noConnectionKey"
        case .customPlaceholder(let customKey):
            key = customKey
        }
        
        return "Your placeholdersProvider is not configured correctly, no placeholder with key: \(key) found!"
    }
}
