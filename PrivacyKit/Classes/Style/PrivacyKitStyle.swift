//
//  PrivacyKitStyle.swift
//  FBSnapshotTestCase
//
//  Created by Jacob Fielding on 1/18/20.
//

import Foundation

/// The PrivacyKitStyle protocol can be used to implement a custom style struct
/// for use with PrivacyKit. Once implemented your custom style can be used
/// in PrivacyKit with the `setStyle(_ style: PrivacyKitStyle)`
/// method.
public protocol PrivacyKitStyle {
    /// The background color for the default Privacy Notice View Controllers
    var backgroundColor: UIColor { get }
    
    /// The background color for the default Privacy Notice View Controllers
    var textColor: UIColor { get }
    
    /// The highlight color used to highlight the agree button when the
    /// User tries to click past the Privacy Notice View Controller
    var buttonHighlightColor: UIColor { get }
    
    /// The background color for the default Privacy Notice View Controllers
    var errorColor: UIColor { get }

    /// A corner radius to apply to the privacy notice background view.
    var backgroundCornerRadius: CGFloat { get }

    /// The primary font for the privacy notice message.
    var paragraphFont: UIFont { get }
    
    /// The highlighted font for the Privacy Policy and Terms of Service
    /// links in the privacy notice message.
    var highlightFont: UIFont { get }

    var paragraphAttrText: [NSAttributedString.Key: Any] { get }
    var highlightsAttrText: [NSAttributedString.Key: Any] { get }
}

extension PrivacyKitStyle {
    public var paragraphAttrText: [NSAttributedString.Key: Any] {
        get {
            return [
                NSAttributedString.Key.font: self.paragraphFont,
                NSAttributedString.Key.foregroundColor: self.textColor
            ]
        }
    }
    public var highlightsAttrText: [NSAttributedString.Key: Any] {
        get {
            return [
                NSAttributedString.Key.font: self.highlightFont,
                NSAttributedString.Key.foregroundColor: self.textColor
            ]
        }
    }
}
