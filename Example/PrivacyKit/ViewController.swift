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
        view.addSubview(resetButton)
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
                                            y: view.frame.height - privacyAcceptedLabel.frame.height - privacyDeniedLabel.frame.height - resetButton.frame.height - padding * 2,
                                            width: privacyAcceptedLabel.frame.width,
                                            height: privacyAcceptedLabel.frame.height)
        
        privacyDeniedLabel.frame = CGRect(x: (view.frame.width - privacyDeniedLabel.frame.width) / 2,
                                          y: view.frame.height - privacyDeniedLabel.frame.height - resetButton.frame.height - padding * 2,
                                          width: privacyDeniedLabel.frame.width,
                                          height: privacyDeniedLabel.frame.height)
        
        resetButton.frame = CGRect(x: (view.frame.width - resetButton.frame.width) / 2,
                                   y: view.frame.height - resetButton.frame.height - padding * 2,
                                   width: resetButton.frame.width,
                                   height: resetButton.frame.height)
    }
    
    func updateLabels() {
        privacyAcceptedLabel.text = "Privacy Accepted: \(PrivacyKit.shared.privacyAccepted())"
        privacyAcceptedLabel.sizeToFit()
        privacyDeniedLabel.text = "Privacy Denied: \(PrivacyKit.shared.privacyDenied())"
        privacyDeniedLabel.sizeToFit()
    }
    
    @objc func reset() {
        PrivacyKit.shared.setPrivacy(accepted: false)
        PrivacyKit.shared.setPrivacy(denied: false)
        
        self.updateLabels()
    }
}

