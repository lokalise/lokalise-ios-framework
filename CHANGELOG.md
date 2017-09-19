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

- Updated internal API url.

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
