//
//  PrivacyNoticeVC.swift
//  FBSnapshotTestCase
//
//  Created by Jacob Fielding on 7/18/18.
//

import UIKit

class PrivacyNoticeVC: UIViewController {

    /** Core Data Interface Model */
    let privacyModel = PrivacyModel()
    
    /** Defaults for Messages */

    /** UI Statics */
    let padding: CGFloat = 15
    
    /** General Views */
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 37/255, green: 39/255, blue: 46/255, alpha: 1)
        return view
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
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
    
    /** Text View Attributes */
    let privacyTextAttr: [String: Any] = [
        NSAttributedStringKey.font.rawValue: UIFont.systemFont(ofSize: 13),
        NSAttributedStringKey.foregroundColor.rawValue: UIColor.white
    ]
    let privacyLinkTextAttr: [String: Any] = [
        NSAttributedStringKey.font.rawValue: UIFont.boldSystemFont(ofSize: 13),
        NSAttributedStringKey.foregroundColor.rawValue: UIColor.white
    ]
    
    /** Action Buttons */
    let agreeButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(PrivacyNoticeVC.agreePrivacy), for: .touchUpInside)
        button.setTitle("Agree", for: .normal)
        button.sizeToFit()
        return button
    }()
    let denyButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(PrivacyNoticeVC.denyPrivacy), for: .touchUpInside)
        button.setTitle("Deny", for: .normal)
        button.sizeToFit()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    /** Action Function s*/
    @objc func agreePrivacy() {
        
    }

    @objc func denyPrivacy() {
        
    }

}
