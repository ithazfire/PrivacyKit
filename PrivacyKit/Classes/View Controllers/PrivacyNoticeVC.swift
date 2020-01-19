//
//  PrivacyNoticeVC.swift
//  PrivacyKit
//
//  Created by Jacob Fielding on 7/18/18.
//

import UIKit

open class PrivacyNoticeVC: UIViewController, UITextViewDelegate {

    /** Core Data Interface Model */
    internal let privacyModel = PrivacyModel()
    
    /** Completion Method */
    var privacyCompletion: PrivacyCompletion?

    /** UI Statics */
    internal let padding: CGFloat = 15
    
    /** General Views */
    internal let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = PrivacyKit.shared.style.backgroundColor
        view.layer.cornerRadius = PrivacyKit.shared.style.backgroundCornerRadius
        return view
    }()
    internal var blurView: UIVisualEffectView?
    
    internal let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = PrivacyKit.shared.style.textColor
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Privacy Notice"
        return label
    }()
    
    /** Primary Text View */
    internal let descriptionTextView: UITextView = {
        let label = UITextView()
        label.backgroundColor = .clear
        label.isEditable = false
        label.isScrollEnabled = true
        return label
    }()

    /** Action Buttons */
    internal let acceptButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(PrivacyKit.shared.style.textColor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitle("Agree", for: .normal)
        button.sizeToFit()
        button.layer.cornerRadius = 7
        return button
    }()
    internal let denyButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(PrivacyKit.shared.style.textColor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitle("Deny", for: .normal)
        button.sizeToFit()
        button.layer.cornerRadius = 7
        return button
    }()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
    }
    
    internal func addDefaultView() {
        /** Set the Privacy Notice Title **/
        titleLabel.text = PrivacyKit.shared.privacyNoticeTitle
        
        /** Set the Privacy Notice Description **/
        descriptionTextView.delegate = self
        descriptionTextView.attributedText = PrivacyKit.shared.getDescription()
        descriptionTextView.linkTextAttributes = PrivacyKit.shared.getLinkTextAttributes()
        
        /** Add Haptic & Error Animation Feedback to Blur View **/
        let gesture = UITapGestureRecognizer(target: self, action: #selector(PrivacyNoticeVC.outerViewTap))
        // gesture.delegate = self
        view.addGestureRecognizer(gesture)
        
        /** Add a Blur View to Prevent the User for Trying to Pass Touch Events Through **/
        if PrivacyKit.shared.includeBlur {
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
            
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.alpha = 0.75
            blurEffectView.frame = view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
            view.addSubview(blurEffectView)
        }
        
        /** Add Basic Stuff **/
        view.addSubview(backgroundView)
        backgroundView.addSubview(titleLabel)
        backgroundView.addSubview(descriptionTextView)
        backgroundView.addSubview(acceptButton)
        
        if PrivacyKit.shared.includeDeny {
            backgroundView.addSubview(denyButton)
        }
        
        acceptButton.addTarget(self, action: #selector(PrivacyNoticeVC.acceptPrivacy), for: .touchUpInside)
        denyButton.addTarget(self, action: #selector(PrivacyNoticeVC.denyPrivacy), for: .touchUpInside)
    }

    /** Action Functions */
    @objc open func acceptPrivacy() {
        PrivacyKit.shared.acceptPrivacy()
        
        self.privacyCompletion?(PrivacyKit.shared.privacyAccepted(), PrivacyKit.shared.privacyDenied())
        print("Accept completion ran.")
        self.dismiss(animated: true)
    }

    @objc open func denyPrivacy() {
        PrivacyKit.shared.denyPrivacy()
        
        self.privacyCompletion?(PrivacyKit.shared.privacyAccepted(), PrivacyKit.shared.privacyDenied())
        print("Deny completion ran.")
        self.dismiss(animated: true)
    }
    
    @objc internal func outerViewTap() {
        if #available(iOS 10.0, *) {
            let feedback = UIImpactFeedbackGenerator(style: .light)
            feedback.prepare()
            feedback.impactOccurred()
        }
        
        UIView.animate(withDuration: 0.2, animations: {
            self.view?.backgroundColor = PrivacyKit.shared.style.errorColor
        }) { (result) in
            self.view?.backgroundColor = .clear
        }
        
        UIView.animate(withDuration: 0.4, delay: 0.0, options: [.curveEaseOut], animations: {
            self.acceptButton.backgroundColor = PrivacyKit.shared.style.buttonHighlightColor
        }) { (_) in
            self.acceptButton.backgroundColor = .clear
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
