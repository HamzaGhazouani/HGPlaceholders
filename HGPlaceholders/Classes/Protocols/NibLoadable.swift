//
//  NibLoadable.swift
//  Pods
//
//  Created by Hamza Ghazouani on 25/07/2017.
//
//

import UIKit

// MARK: Protocol Definition

/** Make your UIView subclasses conform to this protocol when:
 * they *are* NIB-based, and
 * this class is used as the XIB's root view
 *
 * to be able to instantiate them from the NIB in a type-safe manner
 */
protocol NibLoadable: class {
    /// The nib file to use to load a new instance of the View designed in a XIB
    static var nib: UINib { get }
}

// MARK: Default implementation

extension NibLoadable {
    /* By default, use the nib which have the same name as the name of the class,
         and located in the bundle of that class */
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}
