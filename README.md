# PrivacyKit

[![CI Status](https://travis-ci.org/ithazfire/PrivacyKit.svg?branch=master)](https://travis-ci.org/ithazfire/PrivacyKit/settings)
[![Version](https://img.shields.io/cocoapods/v/PrivacyKit.svg?style=flat)](https://cocoapods.org/pods/PrivacyKit)
[![License](https://img.shields.io/cocoapods/l/PrivacyKit.svg?style=flat)](https://cocoapods.org/pods/PrivacyKit)
[![Platform](https://img.shields.io/cocoapods/p/PrivacyKit.svg?style=flat)](https://cocoapods.org/pods/PrivacyKit)
[![Coverage Status](https://coveralls.io/repos/github/ithazfire/PrivacyKit/badge.svg?branch=master)](https://coveralls.io/github/ithazfire/PrivacyKit?branch=master)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/ec0c6633ce234ec09cab393f2828958f)](https://app.codacy.com/gh/ithazfire/PrivacyKit?utm_source=github.com&utm_medium=referral&utm_content=ithazfire/PrivacyKit&utm_campaign=Badge_Grade_Dashboard)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

<img src="Docs/img/PrivacyKit-Basic.jpg" alt="Basic Example Screenshot" width="376px"/>

## Installation

PrivacyKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PrivacyKit'
```

## Basic Usage

To configure PrivacyKit globally, do so from the
`AppDelegate.application(didFinishLaunchingWithOptions)` function.

```swift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        /** Configure PrivacyKit Globally */
        PrivacyKit.shared.config("https://github.com/ithazfire/PrivacyKit")

        // Override point for customization after application launch.
        return true
    }
}
```

To present the PrivacyKit UIViewController add the delegate to your `UIViewController`
and call the `requirePrivacy()` function.

```swift
class ViewController: UIViewController, PrivacyKitDelegate {
    override func viewDidAppear(_ animated: Bool) {
        /** Present the PrivacyKit View if Privacy is not accepted. */
        self.requirePrivacy()
    }
}
```

## Author

[Archdoog](https://github.com/Archdoog)

## License

PrivacyKit is available under the MIT license. See the LICENSE file for more info.
