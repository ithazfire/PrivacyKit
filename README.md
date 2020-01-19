# PrivacyKit

[![Version](https://img.shields.io/cocoapods/v/PrivacyKit.svg?style=flat)](https://cocoapods.org/pods/PrivacyKit)
[![License](https://img.shields.io/cocoapods/l/PrivacyKit.svg?style=flat)](https://cocoapods.org/pods/PrivacyKit)
[![Platform](https://img.shields.io/cocoapods/p/PrivacyKit.svg?style=flat)](https://cocoapods.org/pods/PrivacyKit)
[![CI Status](https://travis-ci.org/ithazfire/PrivacyKit.svg?branch=master)](https://travis-ci.org/ithazfire/PrivacyKit/settings)
[![Coverage Status](https://coveralls.io/repos/github/ithazfire/PrivacyKit/badge.svg?branch=master)](https://coveralls.io/github/ithazfire/PrivacyKit?branch=master)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/ec0c6633ce234ec09cab393f2828958f)](https://app.codacy.com/gh/ithazfire/PrivacyKit?utm_source=github.com&utm_medium=referral&utm_content=ithazfire/PrivacyKit&utm_campaign=Badge_Grade_Dashboard)

## Documentation

* **[Documentation](https://ithazfire.github.io/PrivacyKit)** - Detailed API Documentation for the PrivacyKit library.
* **[How to Customize](https://ithazfire.github.io/PrivacyKit/customizing.html)** - Customizing the PrivacyKit ViewControllers.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

<img src="https://github.com/ithazfire/PrivacyKit/raw/master/Guides/img/PrivacyKit-Basic.jpg" alt="Basic Example Screenshot" width="376px"/>

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
        PrivacyKit.shared.config("https://github.com/ithazfire/PrivacyKit",
                                 "https://github.com/ithazfire/PrivacyKit/wiki")

        /** Use Custom Style (Colors & Fonts) **/        PrivacyKit.shared.setStyle(CustomPrivacyKitStyle())

        /** User Blur Effect Over Presenting View Controller **/          PrivacyKit.shared.setBlurView(isEnabled: true)

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

## More Examples

<img src="https://github.com/ithazfire/PrivacyKit/raw/master/Guides/img/PrivacyKit-CustomStyle-Top.jpg" alt="Custom Example Screenshot" width="376px"/>
<img src="https://github.com/ithazfire/PrivacyKit/raw/master/Guides/img/PrivacyKit-Alert.jpg" alt="Custom Example Screenshot" width="376px"/>

* **[Video Demonstration](https://youtu.be/Ylmr647w4dY)**

## Author

[Archdoog](https://github.com/Archdoog)

## License

PrivacyKit is available under the MIT license. See the LICENSE file for more info.

## Contributing

If you want to contribute to a project and make it better, your help is very welcome. Contributing is also a great way to learn more about social coding on Github, new technologies and and their ecosystems and how to make constructive, helpful bug reports, feature requests and the noblest of all contributions: a good, clean pull request.

### How to make a clean pull request

Look for a project's contribution instructions. If there are any, follow them.

- Create a personal fork of the project on Github.
- Clone the fork on your local machine. Your remote repo on Github is called `origin`.
- Add the original repository as a remote called `upstream`.
- If you created your fork a while ago be sure to pull upstream changes into your local repository.
- Create a new branch to work on! Branch from `develop` if it exists, else from `master`.
- Implement/fix your feature, comment your code.
- Follow the code style of the project, including indentation.
- If the project has tests run them!
- Write or adapt tests as needed.
- Add or change the documentation as needed.
- Squash your commits into a single commit with git's [interactive rebase](https://help.github.com/articles/interactive-rebase). Create a new branch if necessary.
- Push your branch to your fork on Github, the remote `origin`.
- From your fork open a pull request in the correct branch. Target the project's `develop` branch if there is one, else go for `master`!
- …
- If the maintainer requests further changes just push them to your branch. The PR will be updated automatically.
- Once the pull request is approved and merged you can pull the changes from `upstream` to your local repo and delete
your extra branch(es).

And last but not least: Always write your commit messages in the present tense. Your commit message should describe what the commit, when applied, does to the code – not what you did to the code.
