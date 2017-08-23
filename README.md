# HGPlaceholders

[![CI Status](http://img.shields.io/travis/HamzaGhazouani/HGPlaceholders.svg?style=flat)](https://travis-ci.org/HamzaGhazouani/HGPlaceholders)
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
- iOS 9.0+
- Xcode 8.3


## You also may like

* **[HGCircularSlider](https://github.com/HamzaGhazouani/HGCircularSlider)** - A custom reusable circular slider control for iOS application.

## Installation

HGPlaceholders is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
# Swift 3.1 - Xcode 8.3
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

```
class ProjectNameTableView: TableView {

    override func customSetup() {
        placeholdersProvider = .basic
    }
}
```

```
class ProjectNameCollectionView: CollectionView {

    override func customSetup() {
        placeholdersProvider = .basic
    }
}
```

You can also add new placeholders fully customizable, you should keep en mind that the view will take table view frame, and placeholder can have only one action, please check the example project 


## Documentation
Full documentation is available on [CocoaDocs](http://cocoadocs.org/docsets/HGPlaceholders/).<br/>
You can also install documentation locally using [jazzy](https://github.com/realm/jazzy).

## Roadmap
- [x] UICollectionView compatibility
- [x] Carthage support
- [ ] Tests

## Author

Hamza Ghazouani, hamza.ghazouani@gmail.com

## License

HGPlaceholders is available under the MIT license. See the LICENSE file for more info.
