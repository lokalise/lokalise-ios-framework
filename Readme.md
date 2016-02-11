# Lokalise iOS framework

**[Lokalise](https://lokali.se)** lets you manage keys and translations of your app, game or website – either on your own or with a team of collaborators. Built for developers, Lokalise offers neat features including inline suggestions, project chat, export webhooks and an API, so you can easily integrate with your projects workflow.

No need to resubmit your app for review to update strings or translations anymore. Use Lokalise iOS framework and get your app localised with a few lines of code.

## Features

- **Over-the-air (OTA) localization**

- **Change application language** – select any language that is supported by project local localization. *([limitations](#limitations))*

- **Test localizations** - create pre-release **OTA** localization bundles for your application. No need to recompile sources. Once the bundles are generated (at Lokalise Download page), see project settings (Lokalise iOS framework tab) to control versions and pre-release status.

### Experimental

Experimental features are available, use at your own risk:

- **NSBundle swizzling:** You can swizzle `[NSBundle mainBundle]` using Lokalise and it will call `[[Lokalise sharedObject] localizedStringForKey:value:table:]` for you.

- **Remote XIB localization:** When main bundle swizzling is enabled user interface files *(xibs and storyboards)* will also be localized using **Lokalise** framework. *(see [limitations](#limitations) to undersand why it doesn't work by default)*



## [Limitations](id:limitations)

- **System localization:** When changing application at runtime, system inteface objects might not get translated *(search bar for example)*.

- **User interfrace localization:** Without `[NSBundle mainBundle]` swizzling user interface will be localized using only local localization. To use remote **Lokalise** localization bundle swizzling must be enabled.

- **Remote localization exports**: You must ensure that all localizations are formatted properly by downloading the .zip bundle form Lokalise and trying to compile it with your app.


## Getting started

To start using Lokalise framework you need to do the following steps:

- [Import](http://docs.lokali.se/en/topic/Uploading-files) source files to Lokalise
- Go to Downloads page, turn off "Use source filenames", select "Lokalise iOS framework" format and Generate the bundle. Note, you can adjust which bundle is the actual production or pre-release bundle in project settings (Lokalise iOS framework tab).
- [Install](#installation) Lokalise framework
- [Setup](#setup) your project



## [Installation](id:installation)

### Cocoapods

To install using **cocoapods** simply add this line to your **Podfile**

```
pod 'Lokalise', '~> 0.3.0'
```

Dependencies will be installed automatically.

### Manual

Download **Lokalise.framework** and add it too your project.

You also need to add **[ZipZap](https://github.com/pixelglow/zipzap)** to your project.

## [Project setup](id:setup)

To connect your application to your **Lokalise** project you need to add a dictionary and specify provided API access token and project ID to **Lokalise** framework. This requires only 3 steps:

1. Create a dictionary named `Lokalise` at the root of your **ProjectName-Info.plist** file.
2. Add string `API Token` to `Lokalise` dictionary and set value to your API access token (see Account in Lokalise).
3. Add string `Project ID` to `Lokalise` dictionary and set value to ID of the project you want to use (see project ID in project settings in Lokalise).

Done! Please note that keys are case-sensitive.

## Usage


Start with updating remote localization to the latest version

```
[[Lokalise sharedObject] checkForUpdates];
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
[[Lokalise sharedObject] checkForUpdates];

```

Force local localization to test your local localization.

```
[Lokalise sharedObject].forceLocalLocalization = YES;
```

## Publishing changes


`[Lokalise sharedObject] checkForUpdates]` sends HTTPS request to Lokalise server to determine if there is a new version of bundle available. If new version is found, it downloads the bundle and stores it locally.

Users would not see any changes in the app copy unless you create a new bundle and set it active. To do so, go to Downloads page again and generate Lokalise iOS framework format bundle. Once done, you can adjust which bundle is used for production and which is used at pre-release (`[Lokalise sharedObject].preReleaseLocalization = YES`).

You may want to send an app beta with pre-release bundle to your testers and switch the bundle to production only once you are sure all the strings are proper.

