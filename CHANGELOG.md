## 1.0.2 (19-04-2024)

### Fixes

- Added missing keys to Privacy Manifest.

## 1.0.1 (15-04-2024)

This is a maintenance release that adds Privacy Manifest, Code signature and adjusts the deployment target to be in line with Xcode 15.

### Changes

- Added Privacy Manifest to `.xcframework`.
- Added Code signature to `.xcframework`.
- Set deployment target to iOS 12.0.

## 1.0.0 (24-07-2023)

This major release does not have functional changes and is marked as such due to the change from `.framework` to `.xframework`, new testing pipelines, and dropped support for iOS 9 and 10.
Still, please view it as a major update and validate that it works in your existing projects.

### Other

- Updated internal API URL.
- Deprecated functionality removed (no effect on public methods).

### Breaking changes

- Moved to `.xcframework` format.
- Deployment target is set to iOS 11.0.

## 0.10.2 (18-12-2020)

### Other

- Improves stability, performance and fixes a vulnerability in a 3rd party component.

## 0.10.1 (22-02-2020)

### Breaking changes

- Deployment target is set to iOS 9.0.

## 0.10.0 (08-02-2019)

### Fixes

- Carthage integration now passes iTunesConnect validation.

### Breaking changes

- The framework is now dynamic (new manual installation process).


## 0.9.0 (21-01-2019)

### New

- Carthage support.
- New `setProjectID:token:` method.

### Behaviour changes

- `setAPIToken:projectID:` is deprecated and will be removed in the future.

## 0.8.1 (04-01-2018)

### Fixes

- No more crashes in edge cases when `checkForUpdates` completion is not provided.

## 0.8.0 (18-12-2017)

### New

- Support for restricting a localization bundle to certain app builds (in your Lokalise dashboard).
- Support for app insights: app and device languages, daily requests and unique apps (in your Lokalise dashboard).

### Behaviour changes

- Improved Lokalise iOS Bundles synchronization.
- `checkForUpdates` will not work when the device is locked.

### Other

- Updated internal API URL.

## 0.7.1 (06-11-2017)

### Fixes

- Fixed `developmentRegion` locale included in `availableLocales`.

## 0.7.0 (17-10-2017)

### New

- `ZipZap` in no longer a dependency.
- Updated License.

## 0.6.3 Release notes (20-09-2017)

### Fixes

- Xcode 8 binary support returned.

## 0.6.2 Release notes (19-09-2017)

### New

- Improved support for many Chinese locales.

## 0.6.1 Release notes (06-09-2017)

### Fixes

- Translation from remote bundle no longer ignored if it's equal to the key.

## 0.6.0 Release notes (03-08-2017)

### New

- Added `LokaliseFrameworkVersion` constant.
- Added `lokaliseBundleVersion` property.
- Added `LokaliseDidUpdateLocalizationNotification` which is called when localization source is changed or updated.
- Added `setLocalizationLocale:makeDefault:completion:` method.
- Added framework modulemap. Swift integration no longer requires bridging header.

### Breaking changes

- Removed `delegate` property and `LokaliseDelegate` protocol in favour of new and updated methods.
- `localizationLocale` property is readonly now *(use `setLocalizationLocale:makeDefault:completion:` method)*.
- `checkForUpdates` method is updated to `checkForUpdatesWithCompletion:`.

## 0.5.1 Release notes (13-06-2017)

### Breaking changes

- Removed `localizationVersion` parameter.

### Other

- Updated internal API URL.

## 0.5.0 Release notes (02-05-2017)

### Braking changes

- `sharedObject` is now a property and available as `shared` property in Swift.

### Behaviour changes

- `checkForUpdates` now checks for update even if another check wasn't finished.
- Changing `localizationType` doesn't call `checkForUpdates` automatically anymore. **Call `checkForUpdates ` manually after changing `localizationType` property**

### Fixes

- Updated `localizationType` documentation. 

## 0.4.1 Release notes (21-04-2017)

### Fixes

- Default `localizationType` fix.

## 0.4.0 Release notes (18-04-2017)

### New

- Added `localizationType` property for linear control of localization source.
- Added `setAPIToken:projectID` method for easy lokalise setup flow.

### Braking changes

- Removed `preReleaseLocalization` in favour of `localizationType`.
- Removed `forceLocalLocalization` in favour of `localizationType`.
- Renamed `token` to `apiToken`.

### Other

- Info.plist setup flow is still supported but is depreciated.
- All `LokaliseDelegate` methods are optional now.
