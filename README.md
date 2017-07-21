# HGPlaceholders

[![Twitter: @GhazouaniHamza](https://img.shields.io/badge/contact-@GhazouaniHamza-blue.svg?style=flat)](https://twitter.com/GhazouaniHamza)
[![CI Status](http://img.shields.io/travis/HamzaGhazouani/HGPlaceholders.svg?style=flat)](https://travis-ci.org/HamzaGhazouani/HGPlaceholders)
[![Version](https://img.shields.io/cocoapods/v/HGPlaceholders.svg?style=flat)](http://cocoapods.org/pods/HGPlaceholders)
[![License](https://img.shields.io/cocoapods/l/HGPlaceholders.svg?style=flat)](http://cocoapods.org/pods/HGPlaceholders)
[![Language](https://img.shields.io/badge/language-Swift-orange.svg?style=flat)]()
[![Platform](https://img.shields.io/cocoapods/p/HGPlaceholders.svg?style=flat)](http://cocoapods.org/pods/HGPlaceholders)
<br />

[![codebeat badge](https://codebeat.co/badges/c4db03f5-903a-4b0e-84bb-98362fc5bd7a)](https://codebeat.co/projects/github-com-hamzaghazouani-hgplaceholders)
[![Documentation](https://img.shields.io/cocoapods/metrics/doc-percent/HGCircularSlider.svg)](http://cocoadocs.org/docsets/HGCircularSlider/)
[![Readme Score](http://readme-score-api.herokuapp.com/score.svg?url=https://github.com/hamzaghazouani/hgplaceholders/)](http://clayallsopp.github.io/readme-score?url=https://github.com/hamzaghazouani/hgplaceholders)

## Example

![](/Screenshots/default.gif) ![](/Screenshots/basic.gif) ![](/Screenshots/custom.gif)
To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
- iOS 9.0+
- Xcode 8.0

## Installation

HGPlaceholders is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
# Swift 3.1 - Xcode 8.3
pod "HGPlaceholders"
```

Features ✨

Flexible and high-customizible placeholders
Automatically swift 
Support @IBInspectable & @IBDesignable
Written with vanilla Swift flavor 🐤

## Usage

1. Inherit your UITableView class from TableView
2. Call the placeholder to show

`tableView.showLoadingPlaceholder()`
`tableView.showNoResultsPlaceholder()`
`tableView.showErrorPlaceholder()`
`tableView.showNoConnectionPlaceholder()`


## Customization 

If you want to change only images, just set them in your asset with this names (the framework check firstly in the main bundle): 

* loading    : "hg_default-loading"
* no_connection    : "hg_default-no_connection"
* no_results    : "hg_default-no_results"
* error    : "hg_default-error"



The framework contains different defaults placeholders:

* Basic    : `tableView.placeholdersProvider = .basic`
* Default  : `tableView.placeholdersProvider = .default`
* Default2 : `tableView.placeholdersProvider = .default2`
* Hallowen : `tableView.placeholdersProvider = .halloween // for fun :)` 


If you want to change the default palceholders for all table views in your project: 

```
class ProjectNameTableView: TableView {

    override func customSetup() {
        placeholdersProvider = .basic
    }
}
```

You can also add new placeholders fully customizable, you should keep en mind that the view will take table view frame, and placeholder can have only one action, please check the example project 


## Documentation
Full documentation is available on [CocoaDocs](http://cocoadocs.org/docsets/HGCircularSlider/).<br/>
You can also install documentation locally using [jazzy](https://github.com/realm/jazzy).

## Roadmap
- [x] UICollectionView compatible
- [x] Carthage support
- [x] Tests

## Author

HamzaGhazouani, hamza.ghazouani@gmail.com

## License

HGPlaceholders is available under the MIT license. See the LICENSE file for more info.
