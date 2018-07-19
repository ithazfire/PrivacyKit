//
//  PrivacyNoticeVC.swift
//  FBSnapshotTestCase
//
//  Created by Jacob Fielding on 7/18/18.
//

import UIKit

class PrivacyNoticeVC: UIViewController {

    /** Core Data Interface Model */
    let manager = PrivacyKit.shared
    let privacyModel = PrivacyModel()

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
    let agreeButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(PrivacyKitUI.colors.basic, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(PrivacyNoticeVC.agreePrivacy), for: .touchUpInside)
        button.setTitle("Agree", for: .normal)
        button.sizeToFit()
        return button
    }()
    let denyButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(PrivacyKitUI.colors.basic, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(PrivacyNoticeVC.denyPrivacy), for: .touchUpInside)
        button.setTitle("Deny", for: .normal)
        button.sizeToFit()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionTextView.attributedText = PrivacyKit.shared.getDescription()
        
        view.addSubview(backgroundView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionTextView)
        view.addSubview(agreeButton)
        
        if manager.includeDeny {
            view.addSubview(denyButton)
        }
    }

    /** Action Functions */
    @objc func agreePrivacy() {
        // ADD Agree Handling
        
        self.dismiss(animated: true, completion: nil)
    }

    @objc func denyPrivacy() {
        // ADD Deny Handling
        
        self.dismiss(animated: true, completion: nil)
    }


}
