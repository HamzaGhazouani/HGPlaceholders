# HGPlaceholders

[![Backers on Open Collective](https://opencollective.com/hgplaceholders/backers/badge.svg)](#backers) [![Sponsors on Open Collective](https://opencollective.com/hgplaceholders/sponsors/badge.svg)](#sponsors) [![CI Status](http://img.shields.io/travis/HamzaGhazouani/HGPlaceholders.svg?style=flat)](https://travis-ci.org/HamzaGhazouani/HGPlaceholders)
[![Version](https://img.shields.io/cocoapods/v/HGPlaceholders.svg?style=flat)](http://cocoapods.org/pods/HGPlaceholders)
[![License](https://img.shields.io/cocoapods/l/HGPlaceholders.svg?style=flat)](http://cocoapods.org/pods/HGPlaceholders)
[![Language](https://img.shields.io/badge/language-Swift-orange.svg?style=flat)]()
[![Supports](https://img.shields.io/badge/supports-CocoaPods%20%7C%20Carthage-green.svg?style=flat)]()
[![Platform](https://img.shields.io/cocoapods/p/HGPlaceholders.svg?style=flat)](http://cocoapods.org/pods/HGPlaceholders)
<br />

[![Twitter: @GhazouaniHamza](https://img.shields.io/badge/contact-@GhazouaniHamza-blue.svg?style=flat)](https://twitter.com/GhazouaniHamza)
[![codebeat badge](https://codebeat.co/badges/c706606b-c02a-4000-af85-6cebf23c5538)](https://codebeat.co/projects/github-com-hamzaghazouani-hgplaceholders-master)
[![Documentation](https://img.shields.io/cocoapods/metrics/doc-percent/HGPlaceholders.svg)](http://cocoadocs.org/docsets/HGPlaceholders/)
[![Readme Score](http://readme-score-api.herokuapp.com/score.svg?url=https://github.com/hamzaghazouani/hgplaceholders/)](http://clayallsopp.github.io/readme-score?url=https://github.com/hamzaghazouani/hgplaceholders)

## Example

![](/Screenshots/default.gif) ![](/Screenshots/custom.gif)

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
- iOS 8.0+
- Xcode 9.2


## You also may like

* **[HGCircularSlider](https://github.com/HamzaGhazouani/HGCircularSlider)** - A custom reusable circular slider control for iOS application.
* **[HGRippleRadarView](https://github.com/HamzaGhazouani/HGRippleRadarView)** - A beautiful radar view to show nearby users with ripple animation, fully customizable

## Installation

HGPlaceholders is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'HGPlaceholders'
```

HGPlaceholders is also available through [Carthage](https://github.com/Carthage/Carthage). To install
it, simply add the following line to your Cartfile:

``` ruby
github "HamzaGhazouani/HGPlaceholders"
```

## Usage

1. Inherit your UITableView class from TableView Or inherit UICollectionView from CollectionView
2. Call the placeholder to show

* `tableView.showLoadingPlaceholder()` or `collectionView.showLoadingPlaceholder()`
* `tableView.showNoResultsPlaceholder()` or `collectionView.showNoResultsPlaceholder()`
* `tableView.showErrorPlaceholder()` or `collectionView.showErrorPlaceholder()`
* `tableView.showNoConnectionPlaceholder()` or `collectionView.showNoConnectionPlaceholder()`


## Customization 

If you want to change only images, just set them in your asset with this names (the framework check firstly in the main bundle): 

* loading    : "hg_default-loading"
* no_connection    : "hg_default-no_connection"
* no_results    : "hg_default-no_results"
* error    : "hg_default-error"



The framework contains different defaults placeholders:

* Basic    : 

`tableView.placeholdersProvider = .basic` or `collectionView.placeholdersProvider = .basic`

* Default  : 

`tableView.placeholdersProvider = .default` or `collectionView.placeholdersProvider = .default` 

* Default2 : 

`tableView.placeholdersProvider = .default2` or `collectionView.placeholdersProvider = .default2` 


* Hallowen : 

`tableView.placeholdersProvider = .halloween` or `collectionView.placeholdersProvider = .halloween` // for fun :)` 

If you want to change the default palceholders for all table views in your project: 

```swift
class ProjectNameTableView: TableView {

    override func customSetup() {
        placeholdersProvider = .basic
    }
}
```

```swift
class ProjectNameCollectionView: CollectionView {

    override func customSetup() {
        placeholdersProvider = .basic
    }
}
```

You can also add new placeholders fully customizable, you should keep in mind that the view will take table view frame, and placeholder can have only one action, please check the example project

### Creating a new theme from scratch 

```swift
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
        
        placeholdersProvider.add(placeholders: xibPlaceholder)
        
        return placeholdersProvider
    }
 ```
 ### Adding a custom placeholder to an existing theme 
    
 ```swift 
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
    
    let provider = PlaceholdersProvider.summer 
    provider.addPlaceholders(MyUtilityClass.starWarsPlaceholder) 
```


## Documentation
Full documentation is available on [CocoaDocs](http://cocoadocs.org/docsets/HGPlaceholders/).<br/>
You can also install documentation locally using [jazzy](https://github.com/realm/jazzy).

## Author

Hamza Ghazouani, hamza.ghazouani@gmail.com

## License

HGPlaceholders is available under the MIT license. See the LICENSE file for more info.
