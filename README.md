# App Version

[![Version](https://img.shields.io/cocoapods/v/ReverseExtension.svg?style=flat)](http://cocoapods.org/pods/AppVersion)
[![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat
)](https://developer.apple.com/swift)
[![License](https://img.shields.io/cocoapods/l/ReverseExtension.svg?style=flat)](http://cocoapods.org/pods/ReverseExtension)
[![Platform](https://img.shields.io/cocoapods/p/ReverseExtension.svg?style=flat)](http://cocoapods.org/pods/ReverseExtension)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

###Micro library to display app version within iOS app.
<p align=center>
    <img src="Images/UITableView_short.png">
</p>

## Example

### Using Storyboard
Create AppVersion label in storyboard: Drag UILabel on your storyboard and set class to `AppVersionLabel`
![Storyboard1](Images/Storyboard_class.png)

After that set format name in Attributes Inpector:
![Storyboard2](Images/Storyboard_format.png)

###  Create  `AppVersionLabel` programatically:

```
let versionLabel = AppVersionLabel()
versionLabel.format = format
versionLabel.textAlignment = .center
versionLabel.textColor = .red
```  

### Add version in UITableView footer:
```swift
tableView.addVersionFooter(with: .longWithName)
```
or
```
tableView.addVersionFooter(with: .long, alignment: .right, textColor: .lightGray, footerHeight: 22)
```

## Requirements

- Swift 4.2
- Xcode 10 or greater
- iOS 11.0 or greater

## Installation

#### CocoaPods

AppVersion is available through [CocoaPods](http://cocoapods.org). To install it add the following line to your Podfile:

```ruby
pod "AppVersion.swift"
```

#### Carthage

If you’re using [Carthage](https://github.com/Carthage/Carthage),  add AppVersion to your `Cartfile`:

```
github "amebalabs/AppVersion"
```
Make sure to add `AppVersion.framework` to "Linked Frameworks and Libraries" and "copy-frameworks" Build Phases.

## License

AppVersion is available under the MIT license. See the LICENSE file for more info.
