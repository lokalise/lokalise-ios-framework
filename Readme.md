# Lokalise iOS framework

**[Lokalise](https://lokali.se)** lets you manage keys and translations of your app, game or website – either on your own or with a team of collaborators. Built for developers, Lokalise offers neat features including inline suggestions, project chat, export webhooks and an API, so you can easily integrate with your projects workflow.

No need to resubmit your app for review to update strings or translations anymore. Use Lokalise iOS framework and get your app localised with a few lines of code. 

## Features

- **Over the air (OTA) localization:** When exporting your iOS strings check `Generate bundle for Lokalise iOS framework` and have them available in your application.

- **Change application language:** You can select any language that is supported by project local localization. *([limitations](#limitations))*

- **Test localizations:** You can create pre-release **OTA** localizations for your application. No need to recompile sources.

### Experimental

Experimental features are available, use at your own risk:

- **NSBundle swizzling:** You can swizzle `[NSBundle mainBundle]` using Lokalise and it will call `[[Lokalise sharedObject] localizedStringForKey:value:table:]` for you.

- **Remote XIB localization:** When main bundle swizzling is enabled user interface files *(xibs and storyboards)* will also be localized using **Lokalise** framework. *(see [limitations](#limitations) to undersand why it doesn't work by default)*



## [Limitations](id:limitations)

- **System localization:** When changing application at runtime, system inteface objects might not get translated *(search bar for example)*.

- **User interfrace localization:** Without `[NSBundle mainBundle]` swizzling user interface will be localized using only local localization. To use remote **Lokalise** localization bundle swizzling must be enabled.

- **Remote localization exports**: You must ensure that all localizations are formatted properly by downloading the .zip bundle form Lokalise and trying to compile it with your app.


## Installation

### Cocoapods

To install using **cocoapods** simply add this line to your **Podfile**

```
pod 'Lokalise', :git => 'git@github.com:lokalise/lokalise-ios-framework.git'
```

Dependencies will be installed automatically.

### Manual

Download **Lokalise.framework** and add it too your project.

You also need to add **[SSZipArchive](https://github.com/soffes/ssziparchive)** to your project.

## Setup

To connect your application to your **Lokalise** project you need to add a dictionary and specify provided API access token and project ID to **Lokalise** framework. This requires only 3 steps:

1. Create a dictionary named `Lokalise` at the root of your **ProjectName-Info.plist** file.
2. Add string `API Token` to `Lokalise` dictionary and set value to your API access token (see Account in Lokalise).
3. Add string `Project ID` to `Lokalise` dictionary and set value to ID of the project you want to use (see project ID in project settings in Lokalise).

Done! Please note that names are case-sensitive.

## Usage

Start with updating remote localization to the latest version

```
[Lokalise sharedObject] checkForUpdates];
```

To get localized string simply call

```
[[Lokalise sharedObject] localizedStringForKey:@"key" value:@"default value" table:@"table name"];
```

To localize interface files using **Lokalise** framework just enable swizzling. Just do it before instantiating any user interfrace files.

```
[[Lokalise sharedObject] swizzleMainBundle];
```

Once swizzled you can use these default localization macros:

```
NSLocalizedString(@"key", @"comment");
NSLocalizedStringFromTable(@"key", @"tableName", @"comment");
```

Get informed about updates and errors by implementing `LokaliseDelegate` protocol and becoming delegate.

```
[Lokalise sharedObject].delegate = self;
```

Enable pre-release localization to test your translations. 

```
[Lokalise sharedObject].preReleaseLocalization = YES;
[Lokalise sharedObject] checkForUpdates];

```

Force local localization to test your local localization.

```
[Lokalise sharedObject].forceLocalLocalization = YES;
```
