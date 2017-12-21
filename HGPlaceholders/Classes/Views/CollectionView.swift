//
//  CollectionView.swift
//  Pods
//
//  Created by Hamza Ghazouani on 26/07/2017.
//
//

import UIKit

///  A collection view  that allows to show easily placeholders like no results, no internet connection, etc
open class CollectionView: UICollectionView {
    
    // MARK: - Public properties
    
    /**
     * The layout used to organize the collected view’s items.
     Assigning a new layout object to this property causes the new layout to be applied (without animations) to the collection view’s items.
     */
    open override var collectionViewLayout: UICollectionViewLayout {
        didSet {
            if collectionViewLayout === placeholderLayout { return }
            defaultLayout = collectionViewLayout
        }
    }
    
    /// The placeholdersProvider property is responsible for the placeholders views and data
    final public var placeholdersProvider = PlaceholdersProvider.default {
        willSet {
            /// before changing the placeholders data, we should be sure that the collectionView is in the default configuration. Otherwise If the dataSource and the delegate are in placeholder configuration, and we set the new data, the old one will be released and we will lose the defaultDataSource and defaultDelegate (they will be set to nil)
            showDefault()
        }
    }
    
    /**
     * The object that acts as the delegate of the collection view placeholders.
     * The delegate must adopt the PlaceholderDelegate protocol. The delegate is not retained.
     */
    public weak var placeholderDelegate: PlaceholderDelegate?
    
    /**
     * The object that acts as the data source of the collection view.
     * The data source must adopt the UICollectionViewDataSource protocol. The data source is not retained.
     */
    open override weak var dataSource: UICollectionViewDataSource? {
        didSet {
            /* we save only the initial data source (and not a placeholder datasource) to allow to go back to the initial data */
            if  dataSource is PlaceholderDataSourceDelegate { return }
            defaultDataSource = dataSource
        }
    }
    
    /**
     * The object that acts as the delegate of the collection view.
     * The delegate must adopt the UICollectionViewDelegate protocol. The delegate is not retained.
     */
    open override weak var delegate: UICollectionViewDelegate? {
        didSet {
            /* we save only the initial delegate (and not the placeholder delegate) to allow to go back to the initial one */
            if  delegate is PlaceholderDataSourceDelegate { return }
            defaultDelegate = delegate
        }
    }
    
    // MARK: - Private properties
    
    /// The defaultDataSource is used to allow to go back to the initial data source of the collection view after switching to a placeholder data source
    internal weak var defaultDataSource: UICollectionViewDataSource?
    
    /// The defaultDelegate is used to allow to go back to the initial delegate of the collection view after switching to a placeholder delegate
    internal weak var defaultDelegate: UICollectionViewDelegate?
    
    /// The defaultAlwaysBounceVertical is used to save the collectionView bouncing setup, because, when you switch to a placeholder, the vertical bounce is disabled
    fileprivate var defaultAlwaysBounceVertical: Bool!
    
    /// The defaultLayout is used to save the collectionView default layout setup, because, when you switch to a placeholder, the layout is changed to placeholderLayout
    fileprivate var defaultLayout: UICollectionViewLayout!
    
    /// The placeholderLayout used to show placeholder cell in the UICollectionView size
    fileprivate var placeholderLayout = PlaceholderLayout()
    
    // MARK: - init methods
    
    /**
     Returns an collection view initialized from data in a given unarchiver.
     
     - parameter aDecoder: An unarchiver object.
     
     - returns: self, initialized using the data in decoder.
     */
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    /**
     Initializes and returns a collection view object having the given frame and style.
     Returns an initialized collectionView object, or nil if the object could not be successfully initialized.
     
     - parameter frame: A rectangle specifying the initial location and size of the collection view in its superview’s coordinates. The frame of the collection view changes as collection cells are added and deleted.
     - parameter style: A constant that specifies the style of the collection view. See collection view Style for descriptions of valid constants.
     
     - returns: Returns an initialized collectionView object, or nil if the object could not be successfully initialized.
     */
    public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        setup()
    }
    
    /**
     *  Config the collection view to be able to show placeholders
     */
    private func setup() {
        // register the placeholder view cell
        register(cellType: PlaceholderCollectionViewCell.self)
        defaultAlwaysBounceVertical = alwaysBounceVertical
        defaultLayout = collectionViewLayout
        customSetup()
    }
    
    /// Implement this method of you want to add new default placeholdersProvider, new default cell, etc
    open func customSetup() {}
    
    // MARK: - Manage collection view data and placeholders
    
    /**
     Switch to different data sources and delegate of the collection view (placeholders and initial data source & delegate)
     
     - parameter theSource:   the selected data source
     - parameter theDelegate: the selected delegate
     */
    internal func switchTo(dataSource theDataSource: UICollectionViewDataSource?, delegate theDelegate: UICollectionViewDelegate? = nil) {
        // if the data source and delegate are already set, no need to switch
        if dataSource === theDataSource && delegate === theDelegate {
            return
        }
        dataSource = theDataSource
        delegate = theDelegate
        super.reloadData()
        collectionViewLayout.invalidateLayout()

        if dataSource is PlaceholderDataSourceDelegate {
            // Placeholder configuration
            alwaysBounceVertical = false
            collectionViewLayout = placeholderLayout
        } else {
            // default configuration
            alwaysBounceVertical = defaultAlwaysBounceVertical
            collectionViewLayout = defaultLayout
        }
    }
    
    /// The total number of rows in all sections of the collectionView
    private func numberOfRowsInAllSections() -> Int {
        let numberOfSections = defaultDataSource?.numberOfSections?(in: self) ?? 1
        var rows = 0
        for i in 0 ..< numberOfSections {
            rows += defaultDataSource?.collectionView(self, numberOfItemsInSection: i) ?? 0
        }
        return rows
    }
    
    /**
     Reloads the rows and sections of the collection view.
     If the number of rows == 0 it shows no results placeholder
     */
    open override func reloadData() {
        // if the collectionView is empty we switch automatically to no data placeholder
        if numberOfRowsInAllSections() == 0 {
            showNoResultsPlaceholder()
            return
        }
        // if the data source is in no data placeholder, and the user tries to reload data, we will switch automatically to default
        if dataSource is PlaceholderDataSourceDelegate {
            showDefault()
            return
        }
        super.reloadData()
    }
}

extension UICollectionView {
    
    /**
     Register a NIB-Based `UICollectionViewCell` subclass (conforming to `Reusable` & `NibLoadable`)
     
     - parameter cellType: the `UICollectionViewCell` (`Reusable` & `NibLoadable`-conforming) subclass to register
     
     - seealso: `register(_:,forCellWithReuseIdentifier:)`
     */
    final func register<T: UICollectionViewCell>(cellType: T.Type)
        where T: Reusable & NibLoadable {
            self.register(cellType.nib, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
}

