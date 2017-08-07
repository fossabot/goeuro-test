# GoEuro Test App
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bhttps%3A%2F%2Fgithub.com%2Fbomjkolyadun%2Fgoeuro-test.svg?type=shield)](https://app.fossa.io/projects/git%2Bhttps%3A%2F%2Fgithub.com%2Fbomjkolyadun%2Fgoeuro-test?ref=badge_shield)


This is an implementation of [GoEuro Test App](https://github.com/goeuro/iOS-Test)

## Requirments
- Latest Cocoapods
- Xcode 8.3.3 or newer
- iOS 8.0+. This was done intentionally to be able to mix Swift, Objective-C, and Dynamic Frameworks. Unfortunately, in 2017 it's a pain to use the combination of Static Libraries, Dependency Managers (such as CocoaPods or Carthage) and Swift. Also, it's pain to install an old Xcode, which supports iOS 7 as the deployment target.
- iPhone 5s+

## How To Build
- Clone the repo
- CocoaPod dependencies were intentionally put to the repo to simplify everything. 
- Launch GoEuro/GoEuro.xcworkspace
- Build GoEuro target
- Launch the app and test the result.

## Third-Party Libs
- AFNetworking – to simplify client-server interactions.


## License
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bhttps%3A%2F%2Fgithub.com%2Fbomjkolyadun%2Fgoeuro-test.svg?type=large)](https://app.fossa.io/projects/git%2Bhttps%3A%2F%2Fgithub.com%2Fbomjkolyadun%2Fgoeuro-test?ref=badge_large)