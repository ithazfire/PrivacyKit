//
//  PrivacyKitConfigure.swift
//  PrivacyKit
//
//  Created by Jacob Fielding on 7/20/18.
//

import Foundation

public protocol PrivacyKitConfigure {
    func config(_ privacyPolicyLink: String)
    func config(_ privacyPolicyLink: String, _ termsOfServiceLink: String)

    func setBlurView(isEnabled enabled: Bool)
    func setStyle(_ style: PrivacyKitStyle)
    func setTitle(_ title: String)
    func setMessage(_ message: String, privacyPolicyLinkText: String?, termsLinkText: String?)

    func enableDeny()
    func disableDeny()
}

public extension PrivacyKitConfigure where Self: PrivacyKit {
    /// Configure PrivacyKit with your privacy policy URL. This funciton does not include a
    /// terms of service.
    /// - Parameter privacyPolicyLink: Your privacy policy's URL (e.g. https://example.com/privacy)
    func config(_ privacyPolicyLink: String) {
        self.privacyPolicyLink = privacyPolicyLink

        self.buildDescription()
    }

    /// Configure PrivacyKit with your privacy policy and terms of service URLs.
    /// - Parameter privacyPolicyLink: Your privacy policy's URL (e.g. https://example.com/privacy)
    /// - Parameter termsOfServiceLink: Your terms of service URL (e.g. https://example.com/terms)
    func config(_ privacyPolicyLink: String, _ termsOfServiceLink: String) {
        self.privacyPolicyLink = privacyPolicyLink
        self.termsOfServiceLink = termsOfServiceLink

        self.buildDescription()
    }
    
    /// Enable or disable the blur view. PrivacyKit presents on top of your current ViewController.
    /// The blur view is a transparent blur that will fog your presenting ViewController.
    /// - Parameter enabled: The blur view should be enabled
    func setBlurView(isEnabled enabled: Bool) {
        self.includeBlur = enabled
    }
    
    /// Update the Privacy Kit Style to a custom type that implements PrivacyKitStyle. This includes
    /// theme colors and minor UI customizations.
    /// - Parameter style: A custom implementation of PrivacyKitStyle. The PrivacyKitStyle protocol
    ///                    should be extended to determine requirements.
    func setStyle(_ style: PrivacyKitStyle) {
        self.style = style

        paragraphAttr = style.paragraphAttrText
        highlightAttr = style.highlightsAttrText

        self.buildDescription()
    }
    
    /// Set a custom title string for the Privacy Notice View Controller.
    /// - Parameter title: The title for the privacy notice.
    func setTitle(_ title: String) {
        self.privacyNoticeTitle = title
    }

    
    /// Set a custom message for the Privacy Notice View Controller. This function automatically generates
    /// Attributed text highlighting and attaching your URL link(s) so they can be clicked and opened in
    /// Safari.
    /// - Parameters:
    ///   - message: The full message including the strings to replace (if any).
    ///   - privacyPolicyLinkText: The string to match for the privacy policy link (e.g. Privacy Policy)
    ///   - termsLinkText: The string to match for the privacy policy link (e.g. Terms or Service)
    /// - Example:
    ///     ~~~
    ///     PrivacyKit.shared.setMessage(
    ///         "My custom message with one link, and another link",
    ///         privacyPolicyLinkText: "one link",
    ///         termsLinkText: "another link")
    ///     ~~~
    ///     In this example, the message includes two string matches (the first for the privacy policy link and the
    ///     second for the terms of service link. PrivacyKit matches the strings in the message while building
    ///     attributed text. It then adds tap actions to both to open the associated URL and highlight the text with
    ///     the current PrivacyKitStyle `highlightFont`
    func setMessage(_ message: String, privacyPolicyLinkText: String?, termsLinkText: String?) {
        self.privacyDescription = message

        if let privacyLink = privacyPolicyLinkText {
            self.privacyPolicyText  = privacyLink
        }

        if let termsLink = termsLinkText {
            self.termsOfServiceText = termsLink
        }

        self.buildDescription()
    }
    
    /// Set a custom message for the Privacy Notice View Controller using a customized and completed
    /// Attributed String. This function skips all the automated tasks like attaching your URL links into the
    /// message so users can click and view your privacy policy or terms in Safari.
    /// - Parameter description: The custom message for the privacy notice.
    func setDescription(_ description: NSMutableAttributedString) {
        self.descriptionAttributed = description
    }
    
    /// Enable the option to Deny the privacy policy. This is disabled by default as a bad practice
    /// but could be used as an Opt Out if your app can disable pushing private user data to
    /// a remote server.
    func enableDeny() {
        self.includeDeny = true
    }

    /// Disable the option to the Deny the privacy policy.
    func disableDeny() {
        self.includeDeny = false
    }
}
