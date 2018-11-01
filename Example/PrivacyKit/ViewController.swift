//
//  ViewController.swift
//  PrivacyKit
//
//  Created by Archdoog on 07/18/2018.
//  Copyright (c) 2018 Archdoog. All rights reserved.
//

import UIKit
import PrivacyKit

class ViewController: UIViewController, PrivacyKitDelegate {

    let verticalOffset: CGFloat = 120
    let padding: CGFloat = 15
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.textColor = .black
        label.text = "PrivacyKit"
        label.sizeToFit()
        return label
    }()
    
    let privacyAcceptedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.sizeToFit()
        return label
    }()
    let privacyDeniedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.sizeToFit()
        return label
    }()
    let privacyLinkTappedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.sizeToFit()
        return label
    }()
    let termsLinkTappedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.sizeToFit()
        return label
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset Privacy", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.sizeToFit()
        button.addTarget(self, action: #selector(ViewController.reset), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateLabels()
        
        view.addSubview(titleLabel)
        view.addSubview(privacyAcceptedLabel)
        view.addSubview(privacyDeniedLabel)
        view.addSubview(privacyLinkTappedLabel)
        view.addSubview(termsLinkTappedLabel)
        view.addSubview(resetButton)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.requirePrivacy(.bottom) {
            print("PrivacyKit: Completion")
            self.updateLabels()
        }
        
        print("PrivacyKit: Full State: \(PrivacyKit.shared.getState())")
    }

    override func viewDidLayoutSubviews() {
        titleLabel.frame = CGRect(x: (view.frame.width - titleLabel.frame.width) / 2,
                                  y: (view.frame.height - titleLabel.frame.height) / 2 - verticalOffset,
                                  width: titleLabel.frame.width,
                                  height: titleLabel.frame.height)
        
        resetButton.frame = CGRect(x: (view.frame.width - resetButton.frame.width) / 2,
                                   y: view.frame.height - resetButton.frame.height - padding * 2,
                                   width: resetButton.frame.width,
                                   height: resetButton.frame.height)
        
        termsLinkTappedLabel.frame = CGRect(x: (view.frame.width - termsLinkTappedLabel.frame.width) / 2,
                                            y: view.frame.height - termsLinkTappedLabel.frame.height - resetButton.frame.height - padding * 2,
                                            width: termsLinkTappedLabel.frame.width,
                                            height: termsLinkTappedLabel.frame.height)
        
        privacyLinkTappedLabel.frame = CGRect(x: (view.frame.width - privacyLinkTappedLabel.frame.width) / 2,
                                              y: termsLinkTappedLabel.frame.minY - privacyLinkTappedLabel.frame.height,
                                              width: privacyLinkTappedLabel.frame.width,
                                              height: privacyLinkTappedLabel.frame.height)
        
        privacyDeniedLabel.frame = CGRect(x: (view.frame.width - privacyDeniedLabel.frame.width) / 2,
                                          y: privacyLinkTappedLabel.frame.minY - privacyDeniedLabel.frame.height,
                                          width: privacyDeniedLabel.frame.width,
                                          height: privacyDeniedLabel.frame.height)
        
        privacyAcceptedLabel.frame = CGRect(x: (view.frame.width - privacyAcceptedLabel.frame.width) / 2,
                                            y: privacyDeniedLabel.frame.minY - privacyAcceptedLabel.frame.height,
                                            width: privacyAcceptedLabel.frame.width,
                                            height: privacyAcceptedLabel.frame.height)
    }
    
    func updateLabels() {
        privacyAcceptedLabel.text = "Privacy Accepted: \(PrivacyKit.shared.privacyAccepted())"
        privacyAcceptedLabel.sizeToFit()
        privacyDeniedLabel.text = "Privacy Denied: \(PrivacyKit.shared.privacyDenied())"
        privacyDeniedLabel.sizeToFit()
        privacyLinkTappedLabel.text = "Privacy Link Tapped: \(PrivacyKit.shared.privacyTapped())"
        privacyLinkTappedLabel.sizeToFit()
        termsLinkTappedLabel.text = "Terms Link Tapped: \(PrivacyKit.shared.termsTapped())"
        termsLinkTappedLabel.sizeToFit()
    }
    
    @objc func reset() {
        PrivacyKit.shared.setPrivacy(accepted: false)
        PrivacyKit.shared.setPrivacy(denied: false)
        PrivacyKit.shared.setPrivacyRead(read: false)
        PrivacyKit.shared.setTermsRead(read: false)
        
        self.updateLabels()
    }
}

