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

    let verticalOffset: CGFloat = 128
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        privacyAcceptedLabel.text = "Privacy Accepted: \(PrivacyKit.shared.privacyAccepted())"
        privacyAcceptedLabel.sizeToFit()
        privacyDeniedLabel.text = "Privacy Denied: \(PrivacyKit.shared.privacyDenied())"
        privacyDeniedLabel.sizeToFit()
        
        view.addSubview(titleLabel)
        view.addSubview(privacyAcceptedLabel)
        view.addSubview(privacyDeniedLabel)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.requirePrivacy(.top)
    }

    override func viewDidLayoutSubviews() {
        titleLabel.frame = CGRect(x: (view.frame.width - titleLabel.frame.width) / 2,
                                  y: (view.frame.height - titleLabel.frame.height) / 2 - verticalOffset,
                                  width: titleLabel.frame.width,
                                  height: titleLabel.frame.height)
        
        privacyAcceptedLabel.frame = CGRect(x: (view.frame.width - privacyAcceptedLabel.frame.width) / 2,
                                            y: (view.frame.height - privacyAcceptedLabel.frame.height * 5),
                                            width: privacyAcceptedLabel.frame.width,
                                            height: privacyAcceptedLabel.frame.height)
        
        privacyDeniedLabel.frame = CGRect(x: (view.frame.width - privacyDeniedLabel.frame.width) / 2,
                                          y: (view.frame.height - privacyDeniedLabel.frame.height * 4),
                                          width: privacyDeniedLabel.frame.width,
                                          height: privacyDeniedLabel.frame.height)
    }
}

