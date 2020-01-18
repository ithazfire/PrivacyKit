//
//  PrivacyNoticeVC.swift
//  PrivacyKit
//
//  Created by Jacob Fielding on 7/18/18.
//

import UIKit

public class PrivacyNoticeVC: UIViewController, UITextViewDelegate {

    /** Core Data Interface Model */
    let privacyModel = PrivacyModel()
    
    /** Completion Method */
    var privacyCompletion: PrivacyCompletion?

    /** UI Statics */
    let padding: CGFloat = 15
    
    /** General Views */
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = PrivacyKitUI.colors.background
        return view
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = PrivacyKitUI.colors.basic
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Privacy Notice"
        return label
    }()
    
    /** Primary Text View */
    let descriptionTextView: UITextView = {
        let label = UITextView()
        label.backgroundColor = .clear
        label.isEditable = false
        return label
    }()

    /** Action Buttons */
    let acceptButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(PrivacyKitUI.colors.basic, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitle("Agree", for: .normal)
        button.sizeToFit()
        return button
    }()
    let denyButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(PrivacyKitUI.colors.basic, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitle("Deny", for: .normal)
        button.sizeToFit()
        return button
    }()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        /** Set the Privacy Notice Title **/
        titleLabel.text = PrivacyKit.shared.privacyNoticeTitle
        
        /** Set the Privacy Notice Description **/
        descriptionTextView.delegate = self
        descriptionTextView.attributedText = PrivacyKit.shared.getDescription()
        descriptionTextView.linkTextAttributes = PrivacyKit.shared.getLinkTextAttributes()
        
        view.addSubview(backgroundView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionTextView)
        view.addSubview(acceptButton)
        
        if PrivacyKit.shared.includeDeny {
            view.addSubview(denyButton)
        }
        
        acceptButton.addTarget(self, action: #selector(PrivacyNoticeVC.acceptPrivacy), for: .touchUpInside)
        denyButton.addTarget(self, action: #selector(PrivacyNoticeVC.denyPrivacy), for: .touchUpInside)
    }

    /** Action Functions */
    @objc func acceptPrivacy() {
        PrivacyKit.shared.acceptPrivacy()
        
        self.dismiss(animated: true) {
            self.privacyCompletion?(PrivacyKit.shared.privacyAccepted(), PrivacyKit.shared.privacyDenied())
        }
    }

    @objc func denyPrivacy() {
        PrivacyKit.shared.denyPrivacy()
        
        self.dismiss(animated: true) {
            self.privacyCompletion?(PrivacyKit.shared.privacyAccepted(), PrivacyKit.shared.privacyDenied())
        }
    }
    
    /** Replace the UITextView Delegate to Capture Actions */
    @available(iOS 10.0, *)
    public func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        /** Registers the Link Tap For Privacy Policy */
        if URL.absoluteString == PrivacyKit.shared.privacyPolicyLink {
            PrivacyKit.shared.tapPrivacyPolicy()
        }
        
        /** Registers the Link Tap For Terms of Service Link */
        if URL.absoluteString == PrivacyKit.shared.termsOfServiceLink {
            PrivacyKit.shared.tapTermsOfService()
        }

        return true
    }
}
