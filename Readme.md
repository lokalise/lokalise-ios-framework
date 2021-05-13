# Lokalise iOS SDK

**[Lokalise](https://lokalise.com)** lets you manage keys and translations of your app, game, or website – either on your own or with a team of collaborators. Built for developers, Lokalise offers neat features including inline suggestions, project chat, export webhooks, and an API, so you can easily integrate with the workflow of your project.

## Features

- Over-the-air (OTA) localization
- Instant UI language switching 
- Test localizations (using prerelease bundles)
- NSBundle swizzling for transparent integration
- XIB and storyboard localization

## Requirements

- Xcode 12+
- iOS 9.0+

## Setup 

### Swift Package Manager

To install using [Swift Package Manager](https://swift.org/package-manager/):

a. Add through **File -> Swift Packages -> Add Package Dependency...** action in Xcode. Use `https://github.com/lokalise/lokalise-ios-framework.git` repository URL and the **Version: Up to Next Minor** starting with `0.10.2` option.

b. Add this line to `dependencies` section of your `Package.swift`:
```
.package(url: "https://github.com/lokalise/lokalise-ios-framework.git", .upToNextMinor(from: "0.10.2"))
```

### CocoaPods

To install using [CocoaPods](https://cocoapods.org):

1. Add these line to your Podfile

```
use_frameworks!
pod 'Lokalise', '~> 0.10.2'
```

### Carthage

To install using [Carthage](https://github.com/Carthage/Carthage):

1. Add this line to your Cartfile

```
binary "https://raw.githubusercontent.com/lokalise/lokalise-ios-framework/master/LokaliseCarthage.json" ~> 0.10.2
```

2. Link **c++ (libc++.tbd)** and **z (libz.tbd)** libraries to your targets.

### Manual *(.framework)*

To install manually:

1. Download **Lokalise.framework** from this repository and add it to your project.

2. Add it to your targets (embed and link).

3. Link **c++ (libc++.tbd)** and **z (libz.tbd)** libraries.

4. Add **Run Script** to your **Build Phases**.
```
bash "${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}/Lokalise.framework/strip-frameworks.sh"
```

### Manual *(.xcframework)*

To install **.xcframework** manualy:

1. Download the [Zip archive](https://github.com/lokalise/lokalise-ios-framework/releases/download/0.10.2/Lokalise.xcframework.0.10.2.zip) containing the **.xcframework**, extract it, and add it to your project.

2. Add it to your targets (embed and link).

## Getting started

Read **[documentation page](https://lokalise.com/blog/getting-started-with-ios-localization/)** for detailed integration guide.

## Support

Please contact us through our live support chat for support and bug reports. It is available at every page on **[lokalise.com](https://lokalise.com)**.
