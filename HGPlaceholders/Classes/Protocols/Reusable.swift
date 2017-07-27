//
//  Reusable.swift
//  Pods
//
//  Created by Hamza Ghazouani on 25/07/2017.
//
//

import UIKit

/// Make your `UITableViewCell` and `UICollectionViewCell` subclasses
/// conform to this protocol to be able to dequeue them in a type-safe manner
protocol Reusable: class {
    /// The reuse identifier to use when registering and later dequeuing a reusable cell
    static var reuseIdentifier: String { get }
}

// MARK: - Default implementation

extension Reusable {
    /// By default, use the name of the class as String for its reuseIdentifier
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
