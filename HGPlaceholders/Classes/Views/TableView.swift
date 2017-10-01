//
//  TableView.swift
//  Pods
//
//  Created by Hamza Ghazouani on 20/07/2017.
//
//

import UIKit


/// The delegate of a TableView/CollectionView object must adopt the PlaceholderDelegate protocol. the method of the protocol allow the delegate to perform placeholders action.
public protocol PlaceholderDelegate: class {
    
    /// Performs the action to the delegate of the table or collection view
    ///
    /// - Parameters:
    ///   - view: the table view or the collection
    ///   - placeholder: The placeholder source of the action
    func view(_ view: Any, actionButtonTappedFor placeholder: Placeholder)
}

///  A table view  that allows to show easily placeholders like no results, no internet connection, etc
open class TableView: UITableView {
    
    // MARK: - Public properties
    
    /// The placeholdersProvider property is responsible for the placeholders views and data
    final public var placeholdersProvider = PlaceholdersProvider.default {
        willSet {
            /// before changing the placeholders data, we should be sure that the tableview is in the default configuration. Otherwise If the dataSource and the delegate are in placeholder configuration, and we set the new data, the old one will be released and we will lose the defaultDataSource and defaultDelegate (they will be set to nil)
            showDefault()
        }
    }
    
    /**
     * The object that acts as the delegate of the table view placeholders.
     * The delegate must adopt the PlaceholderDelegate protocol. The delegate is not retained.
     */
    public weak var placeholderDelegate: PlaceholderDelegate?
    
    /**
     * The object that acts as the data source of the table view.
     * The data source must adopt the UITableViewDataSource protocol. The data source is not retained.
     */
    weak open override var dataSource: UITableViewDataSource? {
        didSet {
            /* we save only the initial data source (and not a placeholder datasource) to allow to go back to the initial data */
            if  dataSource is PlaceholderDataSourceDelegate { return }
            defaultDataSource = dataSource
        }
    }
    
    /**
     * The object that acts as the delegate of the table view.
     * The delegate must adopt the UITableViewDelegate protocol. The delegate is not retained.
     */
    open override weak var delegate: UITableViewDelegate? {
        didSet {
            /* we save only the initial delegate (and not the placeholder delegate) to allow to go back to the initial one */
            if  delegate is PlaceholderDataSourceDelegate { return }
            defaultDelegate = delegate
        }
    }
    
    /**
     * Returns an accessory view that is displayed above the table.
     * The default value is nil. The table header view is different from a section header.
     */
    open override var tableHeaderView: UIView? {
        didSet {
            if tableHeaderView == nil { return }
            
            defaultTableHeaderView = tableHeaderView
        }
    }
    
    /**
     * Returns an accessory view that is displayed below the table.
     * The default value is nil. The table footer view is different from a section footer.
     */
    open override var tableFooterView: UIView? {
        didSet {
            if tableFooterView == nil { return }
            
            defaultTableFooterView = tableFooterView
        }
    }
    
    // MARK: - Private properties
    
    /// The defaultDataSource is used to allow to go back to the initial data source of the table view after switching to a placeholder data source
    internal weak var defaultDataSource: UITableViewDataSource?
    
    /// The defaultDelegate is used to allow to go back to the initial delegate of the table view after switching to a placeholder delegate
    internal weak var defaultDelegate: UITableViewDelegate?
    
    /// The defaultSeparatorStyle is used to save the tableview separator style, because, when you switch to a placeholder, is changed to `.none`
    fileprivate var defaultSeparatorStyle: UITableViewCellSeparatorStyle!
    
    /// The defaultAlwaysBounceVertical is used to save the tableview bouncing setup, because, when you switch to a placeholder, the vertical bounce is disabled
    fileprivate var defaultAlwaysBounceVertical: Bool!
    
    /// The defaultTableViewHeader is used to save the tableview header when you switch to placeholders
    fileprivate var defaultTableHeaderView: UIView?
    
    /// The defaultTableViewFooter is used to save the tableview footer when you switch to placeholders
    fileprivate var defaultTableFooterView: UIView?
    
    // MARK: - init methods
    
    /**
     Returns an table view initialized from data in a given unarchiver.
     
     - parameter aDecoder: An unarchiver object.
     
     - returns: self, initialized using the data in decoder.
     */
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    /**
     Initializes and returns a table view object having the given frame and style.
     Returns an initialized TableView object, or nil if the object could not be successfully initialized.
     
     - parameter frame: A rectangle specifying the initial location and size of the table view in its superview’s coordinates. The frame of the table view changes as table cells are added and deleted.
     - parameter style: A constant that specifies the style of the table view. See Table View Style for descriptions of valid constants.
     
     - returns: Returns an initialized TableView object, or nil if the object could not be successfully initialized.
     */
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        setup()
    }
    
    /**
     *  Config the table view to be able to show placeholders
     */
    private func setup() {
        // register the placeholder view cell
        register(cellType: PlaceholderTableViewCell.self)
        
        defaultSeparatorStyle = separatorStyle
        defaultAlwaysBounceVertical = alwaysBounceVertical
        
        defaultTableHeaderView = tableHeaderView
        defaultTableFooterView = tableFooterView
        
        customSetup()
    }
    
    /// Implement this method of you want to add new default placeholdersProvider, new default cell, etc
    open func customSetup() {}
    
    // MARK: - Manage table view data and placeholders
    
    /**
     Switch to different data sources and delegate of the table view (placeholders and initial data source & delegate)
     
     - parameter theSource:   the selected data source
     - parameter theDelegate: the selected delegate
     */
    internal func switchTo(dataSource theDataSource: UITableViewDataSource?, delegate theDelegate: UITableViewDelegate? = nil) {
        // if the data source and delegate are already set, no need to switch
        if dataSource === theDataSource && delegate === theDelegate {
            return
        }
        
        if theDataSource is PlaceholderDataSourceDelegate {
            // placeholder configuration
            separatorStyle = .none
            alwaysBounceVertical = false
            tableHeaderView = nil
            tableFooterView = nil
        }
        else {
            // default configuration
            separatorStyle = defaultSeparatorStyle
            alwaysBounceVertical = defaultAlwaysBounceVertical
            tableHeaderView = defaultTableHeaderView
            tableFooterView = defaultTableFooterView
        }
        
        dataSource = theDataSource
        delegate = theDelegate
        super.reloadData()
    }
    
    /// The total number of rows in all sections of the tableView
    private func numberOfRowsInAllSections() -> Int {
        let numberOfSections = defaultDataSource?.numberOfSections?(in: self) ?? 1
        var rows = 0
        for i in 0 ..< numberOfSections {
            rows += defaultDataSource?.tableView(self, numberOfRowsInSection: i) ?? 0
        }
        return rows
    }
    
    /**
     Reloads the rows and sections of the table view.
     If the number of rows == 0 it shows no results placeholder
     */
    open override func reloadData() {
        // if the tableview is empty we switch automatically to no data placeholder
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

extension UITableView {
    /**
     Register a NIB-Based `UITableViewCell` subclass (conforming to `Reusable` & `NibLoadable`)
     
     - parameter cellType: the `UITableViewCell` (`Reusable` & `NibLoadable`-conforming) subclass to register
     
     - seealso: `register(_:,forCellReuseIdentifier:)`
     */
    final func register<T: UITableViewCell>(cellType: T.Type)
        where T: Reusable & NibLoadable {
            self.register(cellType.nib, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
}
