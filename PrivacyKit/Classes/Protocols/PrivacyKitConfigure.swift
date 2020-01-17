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
    
    func setTitle(_ title: String)
    func setMessage(_ message: String, privacyPolicyLinkText: String?, termsLinkText: String?)
    
    func enableDeny()
    func disableDeny()
}

public extension PrivacyKitConfigure where Self: PrivacyKit {
    func config(_ privacyPolicyLink: String) {
        self.privacyPolicyLink = privacyPolicyLink
        
        self.buildDescription()
    }
    
    func config(_ privacyPolicyLink: String, _ termsOfServiceLink: String) {
        self.privacyPolicyLink = privacyPolicyLink
        self.termsOfServiceLink = termsOfServiceLink
        
        self.buildDescription()
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
        
        self.buildDescription()
    }
    
    func setDescription(_ description: NSMutableAttributedString) {
        self.descriptionAttributed = description
    }
    
    func enableDeny() {
        self.includeDeny = true
    }
    
    func disableDeny() {
        self.includeDeny = false
    }
}
