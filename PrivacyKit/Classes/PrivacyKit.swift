//
//  PrivacyKit.swift
//  FBSnapshotTestCase
//
//  Created by Jacob Fielding on 7/18/18.
//

import Foundation

public class PrivacyKit {
    
    /** Shared Singleton */
    public static let shared = PrivacyKit()
    
    /** Data Model */
    let privacyModel = PrivacyModel()
    
    /** String Attribute Parts */
    let privacyTextAttr: [NSAttributedStringKey: Any] = [
        NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13),
        NSAttributedStringKey.foregroundColor: PrivacyKitUI.colors.basic
    ]
    let privacyLinkTextAttr: [NSAttributedStringKey: Any] = [
        NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 13),
        NSAttributedStringKey.foregroundColor: PrivacyKitUI.colors.basic
    ]
    
    /** Default Data */
    var privacyDescriptionAttributed: NSMutableAttributedString?
    var privacyDescriptionParts: [String]?
    var privacyNoticeTitle: String = "Privacy Notice"
    var privacyDescription: String = "This App collects personally identifyable data as outlined in the Privacy Policy. By continuing to use the app you consent to the policy."
    var privacyPolicyText: String = "Privacy Policy"
    var termsOfServiceText: String?
    var privacyPolicyLink: String?
    var termsOfServiceLink: String?
    var includeDeny: Bool = true
    
    
    init() {
        /** Split the Default Privacy Message */
        privacyModel.buildDefaults()
        
        self.splitPrivacyMessage()
    }
    
    public func config(_ privacyPolicyLink: String) {
        self.privacyPolicyLink = privacyPolicyLink
    }
    
    public func config(_ privacyPolicyLink: String, termsLink: String) {
        self.privacyPolicyLink = privacyPolicyLink
        self.termsOfServiceLink = termsLink
    }
    
    public func setTitle(_ title: String) {
        self.privacyNoticeTitle = title
    }
    
    public func setMessage(_ message: String, privacyPolicyLinkText: String?, termsLinkText: String?) {
        self.privacyDescription = message
        
        if let privacyLink = privacyPolicyLinkText {
            self.privacyPolicyText  = privacyLink
        }
        
        if let termsLink = termsLinkText {
            self.termsOfServiceText = termsLink
        }
        
        self.splitPrivacyMessage()
    }
    
    fileprivate func splitPrivacyMessage() {
        if let privacyTextRange = self.privacyDescription.range(of: self.privacyPolicyText) {
            self.privacyDescriptionParts = [
                String(self.privacyDescription[..<privacyTextRange.lowerBound]),
                String(self.privacyDescription[privacyTextRange.lowerBound..<privacyTextRange.upperBound]),
                String(self.privacyDescription[privacyTextRange.upperBound...])
            ]
        }
            
        var termsTextRange: Range<String.Index>?
        if let termsText = self.termsOfServiceText {
            if let termsTextRange = self.privacyDescription.range(of: termsText) {
                print("Terms of Service Range: \(termsTextRange)")
                // ADD HANDLING for Terms Text Range!
            }
        }
        
        print("Privacy Description Parts: \(privacyDescriptionParts)")
    }
    
    fileprivate func buildAttributedString() {
        
    }
    
    public func enableDeny() {
        self.includeDeny = true
    }
    
    public func disableDeny() {
        self.includeDeny = false
    }
    
    public func allowDismiss() {
        
    }
    
    public func getDescription() -> NSMutableAttributedString {
        /** Return the Custom Attributed String if Available */
        if let custom = self.privacyDescriptionAttributed {
            return custom
        }
        
        let description = NSMutableAttributedString(string: String(""))
        if let parts = self.privacyDescriptionParts {
            for part in parts {
                var attributes: [NSAttributedStringKey: Any] = privacyTextAttr
                if part == privacyPolicyText || part == termsOfServiceText {
                    attributes = privacyLinkTextAttr
                }
                description.append(
                    NSMutableAttributedString(
                        string: part,
                        attributes: attributes
                    )
                )
            }
        }
        
        return description
    }
}
