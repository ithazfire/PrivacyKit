# Customizing Privacy Kit

PrivacyKit allows multiple methods for customization using both the
`PrivacyKitStyle` protocol and the custom Privacy Notice ViewController

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

<img src="Guides/img/PrivacyKit-CustomStyle.jpg" alt="Custom Style Example Screenshot" width="376px"/>

## Making a Custom PrivacyKitStyle

Implementing a new PrivacyKitStyle inside your App can be done similar to
the example below. A custom style allows you to modify the Privacy Notice
colors, basic fonts, and the corner radius of the background.

```swift
import UIKit
import PrivacyKit

public struct CustomPrivacyKitStyle: PrivacyKitStyle {
    public var backgroundColor: UIColor = UIColor(red: 252/255, green: 202/255, blue: 70/255, alpha: 1)
    public var textColor: UIColor = UIColor(red: 35/255, green: 61/255, blue: 77/255, alpha: 1)
    public var buttonHighlightColor: UIColor = UIColor(red: 97/255, green: 155/255, blue: 138/255, alpha: 1)
    public var errorColor: UIColor = UIColor(red: 249/255, green: 87/255, blue: 56/255, alpha: 1)

    public var backgroundCornerRadius: CGFloat = 14

    public var paragraphFont: UIFont = UIFont.systemFont(ofSize: 14)
    public var highlightFont: UIFont = UIFont.boldSystemFont(ofSize: 14)
}
```

To use the custom style, you need to set PrivacyKit's style before
requiring privacy. This can be done inside the AppDelegate after you call
configure.

```swift
PrivacyKit.shared.config("https://example.com/privacy")
PrivacyKit.shared.setStyle(CustomPrivacyKitStyle())
```
