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
