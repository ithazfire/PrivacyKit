//
//  PrivacyManager.swift
//  FBSnapshotTestCase
//
//  Created by Jacob Fielding on 7/18/18.
//

import Foundation

class PrivacyManager {
    
    /** Data Model */
    let privacyModel = PrivacyModel()
    
    /** View Controller Setup */
    var privacyNoticeVCType: PrivacyNoticeType = .alert
    var privacyNoticeVC: PrivacyNoticeVC?
    
    /** Default Data */
    var privacyDescrtionParts: [String]?
    var privacyNoticeTitle: String = "Privacy Notice"
    var privacyDescription: String = "This App collects personally identifyable data as outlined in the Privacy Policy. By continuing to use the app you consent to the policy."
    var privacyPolicyText: String = "Privacy Policy"
    var termsOfServiceText: String?
    var privacyPolicyLink: String?
    var termsOfServiceLink: String?
    var includeDeny: Bool = false
    
    init(viewType: PrivacyNoticeType) {
        self.privacyNoticeVCType = viewType
        
        /** Split the Default Privacy Message */
        self.splitPrivacyMessage()
    }
    
    func config(_ privacyPolicyLink: String) {
        self.privacyPolicyLink = privacyPolicyLink
    }
    
    func config(_ privacyPolicyLink: String, termsLink: String) {
        self.privacyPolicyLink = privacyPolicyLink
        self.termsOfServiceLink = termsLink
    }
    
    func setTitle(_ title: String) {
        self.privacyNoticeTitle = title
    }
    
    func setMessage(_ message: String, privacyPolicyLinkText: String?, termsLinkText: String?) {
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
        let privacyTextRange = self.privacyDescription.range(of: self.privacyPolicyText)
        
        var termsTextRange: Range<String.Index>?
        if let termsText = self.termsOfServiceText {
            termsTextRange = self.privacyDescription.range(of: termsText)
        }
        
        print("Privacy Range: \(privacyTextRange)")
        print("Terms of Service Range: \(termsTextRange)")
    }
    
    func enableDeny() {
        self.includeDeny = true
    }
    
    func disableDeny() {
        self.includeDeny = false
    }
    
    func allowDismiss() {
        
    }
}
