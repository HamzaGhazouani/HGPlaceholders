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

You can also add new placeholders fully customizable, you should keep in mind that the view will take table view frame, and placeholder can have only one action, please check the example project


## Documentation
Full documentation is available on [CocoaDocs](http://cocoadocs.org/docsets/HGPlaceholders/).<br/>
You can also install documentation locally using [jazzy](https://github.com/realm/jazzy).


## Author

Hamza Ghazouani, hamza.ghazouani@gmail.com

## Contributors

This project exists thanks to all the people who contribute. [[Contribute](CONTRIBUTING.md)].
<a href="graphs/contributors"><img src="https://opencollective.com/hgplaceholders/contributors.svg?width=890" /></a>


## Backers

Thank you to all our backers! 🙏 [[Become a backer](https://opencollective.com/hgplaceholders#backer)]

<a href="https://opencollective.com/hgplaceholders#backers" target="_blank"><img src="https://opencollective.com/hgplaceholders/backers.svg?width=890"></a>


## Sponsors

Support this project by becoming a sponsor. Your logo will show up here with a link to your website. [[Become a sponsor](https://opencollective.com/hgplaceholders#sponsor)]

<a href="https://opencollective.com/hgplaceholders/sponsor/0/website" target="_blank"><img src="https://opencollective.com/hgplaceholders/sponsor/0/avatar.svg"></a>
<a href="https://opencollective.com/hgplaceholders/sponsor/1/website" target="_blank"><img src="https://opencollective.com/hgplaceholders/sponsor/1/avatar.svg"></a>
<a href="https://opencollective.com/hgplaceholders/sponsor/2/website" target="_blank"><img src="https://opencollective.com/hgplaceholders/sponsor/2/avatar.svg"></a>
<a href="https://opencollective.com/hgplaceholders/sponsor/3/website" target="_blank"><img src="https://opencollective.com/hgplaceholders/sponsor/3/avatar.svg"></a>
<a href="https://opencollective.com/hgplaceholders/sponsor/4/website" target="_blank"><img src="https://opencollective.com/hgplaceholders/sponsor/4/avatar.svg"></a>
<a href="https://opencollective.com/hgplaceholders/sponsor/5/website" target="_blank"><img src="https://opencollective.com/hgplaceholders/sponsor/5/avatar.svg"></a>
<a href="https://opencollective.com/hgplaceholders/sponsor/6/website" target="_blank"><img src="https://opencollective.com/hgplaceholders/sponsor/6/avatar.svg"></a>
<a href="https://opencollective.com/hgplaceholders/sponsor/7/website" target="_blank"><img src="https://opencollective.com/hgplaceholders/sponsor/7/avatar.svg"></a>
<a href="https://opencollective.com/hgplaceholders/sponsor/8/website" target="_blank"><img src="https://opencollective.com/hgplaceholders/sponsor/8/avatar.svg"></a>
<a href="https://opencollective.com/hgplaceholders/sponsor/9/website" target="_blank"><img src="https://opencollective.com/hgplaceholders/sponsor/9/avatar.svg"></a>



## License

HGPlaceholders is available under the MIT license. See the LICENSE file for more info.
