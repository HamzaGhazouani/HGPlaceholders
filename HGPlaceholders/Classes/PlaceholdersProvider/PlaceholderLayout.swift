//
//  PlaceholderLayout.swift
//  HGPlaceholders
//
//  Created by Hamza Ghazouani on 22/08/2017.
//  Copyright © 2017 Hamza Ghazouani. All rights reserved.
//

import UIKit

class PlaceholderLayout: UICollectionViewFlowLayout {
    
    override func invalidateLayout(with context: UICollectionViewLayoutInvalidationContext) {
        // A workaround to fix UICollectionViewFlowLayout crash in iOS 9: 
        // [If you override this method, you must call super at some point in your implementation.]
        // but when the super is called the app crash
        // TODO: Create a custom layout inherits from UICollectionViewLayout
        if #available(iOS 10, *) {
            super.invalidateLayout(with: context)
        }
    }
}
