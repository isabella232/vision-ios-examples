[![Secret-shield enabled](https://github.com/mapbox/secret-shield/blob/assets/secret-shield-enabled-badge.svg)](https://github.com/mapbox/secret-shield/blob/master/docs/enabledBadge.md)

# Mapbox Vision SDK Examples

Example application showing usage of [Mapbox Vision SDK](https://vision.mapbox.com/).

## Dependencies
1. `brew install SwiftGen` (6.0 or later)
1. `brew install carthage` (0.33.0 or later)

## Tokens
In order to fetch and use Vision SDK, you will need to obtain two tokens at [tokens page in your Mapbox account](https://account.mapbox.com/access-tokens/create/):
1. **Public token:** create a token that includes the `vision:read` scope
1. **Secret token:** create another one with the `vision:download` scope

## Installation
1. `git clone https://github.com/mapbox/vision-ios-examples.git`
1. `cd vision-ios-examples`
1. Open `Cartfile` and uncomment two lines concerning Vision:
	- `binary "https://api.mapbox.com/downloads/...`
	- `github "mapbox/mapbox-vision-ios"...`
1. Put your *private* token instead of `<ADD-TOKEN-HERE>` in `Cartfile`
1. `carthage update --platform ios`
1. `open demo.xcodeproj`
1. Put your *public* token into the value of the `MGLMapboxAccessToken` key within the `Info.plist` file
1. Run the application
