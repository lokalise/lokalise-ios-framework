# Lokalise iOS SDK

**[Lokalise](https://lokalise.co)** lets you manage keys and translations of your app, game or website – either on your own or with a team of collaborators. Built for developers, Lokalise offers neat features including inline suggestions, project chat, export webhooks and an API, so you can easily integrate with your projects workflow.

## Features

- Over-the-air (OTA) localization
- Instant UI language switching 
- Test localizations (using prerelease bundles)
- NSBundle swizzling for transparent integration
- XIB and storyboard localization

## Requirements

- Xcode 8.3+
- iOS 8.0+

## Quick setup

### CocoaPods

To install using CocoaPods simply add this line to your Podfile

```
use_frameworks!
pod 'Lokalise', '~> 0.8.0'
```

### Carthage

To install using [Carthage](https://github.com/Carthage/Carthage) simply add below line to your Cartfile

```none
binary "https://raw.githubusercontent.com/lokalise/lokalise-ios-framework/master/carthage/Lokalise.json" ~> {version}
```

If you would like to install manually, download Lokalise.framework and add it to your project and link c++ (libc++.tbd) and z (libz.tbd) libraries.

## Getting started

Read **[documentation page](http://docs.lokalise.co/article/mL6XaIoAcw-lokalise-i-os-framework)** for detailed integration guide.

## Support

Please contact us through our live support chat for support and bug reports. It is available at every page on **[lokalise.co](https://lokalise.co)**.
