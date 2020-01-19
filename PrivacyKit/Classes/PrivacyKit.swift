//
//  PrivacyKit.swift
//  PrivacyKit
//
//  Created by Jacob Fielding on 7/18/18.
//

import Foundation

public class PrivacyKit: PrivacyKitConfigure, PrivacyKitState, PrivacyKitAttrText {
    
    /** Shared Singleton */
    public static let shared = PrivacyKit()
    
    /** Data Model */
    let privacyModel: PrivacyModel
    
    /** **/
    var style: PrivacyKitStyle
    
    /** Configuration Parameters */
    var includeBlur: Bool = false
    var includeDeny: Bool = true
    
    /** Default Data */
    var descriptionAttributed: NSMutableAttributedString?
    var descriptionParts: [String]?
    
    /** Notice Title */
    var privacyNoticeTitle: String = "Privacy Notice"
    
    /** Simple Privacy Policy Only Notice */
    var privacyDescription: String = """
        This App collects personally identifyable data as outlined in the \
        Privacy Policy. By continuing to use the app you consent to the policy.
        """
    var privacyPolicyText: String = "Privacy Policy"
    
    /** Privacy and Terms of Service Notice */
    var termsOfServiceDescription: String = """
        This App collects personally identifyable data as outlined in the \
        Privacy Policy and includes a Terms of Service. By continuing to \
        use the app you consent to the policy and terms.
        """
    var termsOfServiceText: String = "Terms of Service"
    
    /** Link Specifications */
    var privacyPolicyLink: String?
    var termsOfServiceLink: String?
    
    /** Link Ranges */
    var privacyPolicyLinkRange: NSRange?
    var termsOfServiceLinkRange: NSRange?
    
    /** Default Atributes */
    var paragraphAttr: [NSAttributedString.Key: Any]
    var highlightAttr: [NSAttributedString.Key: Any]
    
    init() {
        /** Fetch or Build Default Privacy Data State */
        privacyModel = PrivacyModel()
        privacyModel.persist()
        
        /** Configure the Privacy Style **/
        style = DefaultPrivacyKitStyle()
        
        paragraphAttr = style.paragraphAttrText
        highlightAttr = style.highlightsAttrText
    }
}
