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
    let innerPadding: CGFloat = 3

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

    let topButton: UIButton = {
        let button = UIButton()
        button.setTitle("Present Top Notice", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.sizeToFit()
        return button
    }()
    let bottomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Present Bottom Notice", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.sizeToFit()
        return button
    }()
    let alertButton: UIButton = {
        let button = UIButton()
        button.setTitle("Present Alert Notice", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.sizeToFit()
        return button
    }()
    let customButton: UIButton = {
        let button = UIButton()
        button.setTitle("Present Custom Notice", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.sizeToFit()
        return button
    }()
    let resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset Privacy", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.sizeToFit()
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

        view.addSubview(topButton)
        view.addSubview(bottomButton)
        view.addSubview(alertButton)
        view.addSubview(customButton)
        view.addSubview(resetButton)

        topButton.addTarget(self, action: #selector(ViewController.doTop), for: .touchUpInside)
        bottomButton.addTarget(self, action: #selector(ViewController.doBottom), for: .touchUpInside)
        alertButton.addTarget(self, action: #selector(ViewController.doAlert), for: .touchUpInside)
        customButton.addTarget(self, action: #selector(ViewController.doCustom), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(ViewController.reset), for: .touchUpInside)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        print("ViewController.viewDidAppear")

        self.requirePrivacy(.bottom) { (accepted, denied) in
            if denied {
                print("PrivacyKit: completed with denied.")
            }

            if accepted {
                print("PrivacyKit: completed with accepted.")
            }

            print("PrivacyKit: ViewDidAppear Privacy Completion State: \(PrivacyKit.shared.getState())")
            self.updateLabels()
        }
    }

    override func viewDidLayoutSubviews() {
        titleLabel.frame = CGRect(x: (view.frame.width - titleLabel.frame.width) / 2,
                                  y: (view.frame.height - titleLabel.frame.height) / 2 - verticalOffset,
                                  width: titleLabel.frame.width,
                                  height: titleLabel.frame.height)

        privacyAcceptedLabel.frame = CGRect(x: (view.frame.width - privacyAcceptedLabel.frame.width) / 2,
                                            y: titleLabel.frame.maxY + padding,
                                            width: privacyAcceptedLabel.frame.width,
                                            height: privacyAcceptedLabel.frame.height)

        privacyDeniedLabel.frame = CGRect(x: (view.frame.width - privacyDeniedLabel.frame.width) / 2,
                                          y: privacyAcceptedLabel.frame.maxY + innerPadding,
                                          width: privacyDeniedLabel.frame.width,
                                          height: privacyDeniedLabel.frame.height)

        privacyLinkTappedLabel.frame = CGRect(x: (view.frame.width - privacyLinkTappedLabel.frame.width) / 2,
                                              y: privacyDeniedLabel.frame.maxY + innerPadding,
                                              width: privacyLinkTappedLabel.frame.width,
                                              height: privacyLinkTappedLabel.frame.height)

        termsLinkTappedLabel.frame = CGRect(x: (view.frame.width - termsLinkTappedLabel.frame.width) / 2,
                                            y: privacyLinkTappedLabel.frame.maxY + innerPadding,
                                            width: termsLinkTappedLabel.frame.width,
                                            height: termsLinkTappedLabel.frame.height)

        topButton.frame = CGRect(x: (view.frame.width - topButton.frame.width) / 2,
                                 y: termsLinkTappedLabel.frame.maxY + innerPadding,
                                 width: topButton.frame.width,
                                 height: topButton.frame.height)

        bottomButton.frame = CGRect(x: (view.frame.width - bottomButton.frame.width) / 2,
                                    y: topButton.frame.maxY + innerPadding,
                                    width: bottomButton.frame.width,
                                    height: bottomButton.frame.height)

        alertButton.frame = CGRect(x: (view.frame.width - alertButton.frame.width) / 2,
                                   y: bottomButton.frame.maxY + innerPadding,
                                   width: alertButton.frame.width,
                                   height: alertButton.frame.height)

        customButton.frame = CGRect(x: (view.frame.width - customButton.frame.width) / 2,
                                    y: alertButton.frame.maxY + innerPadding,
                                    width: customButton.frame.width,
                                    height: customButton.frame.height)

        resetButton.frame = CGRect(x: (view.frame.width - resetButton.frame.width) / 2,
                                   y: customButton.frame.maxY + innerPadding,
                                   width: resetButton.frame.width,
                                   height: resetButton.frame.height)
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

    @objc func doTop() {
        self.reset()

        print("PrivacyKit: Presenting Top Notice")
        requirePrivacy(.top) { (accepted, denied) in
            print("Top Privacy Notice completed with results... accepted: \(accepted), denied: \(denied)")
            self.updateLabels()
        }
    }

    @objc func doBottom() {
        self.reset()

        print("PrivacyKit: Presenting Bottom Notice")
        requirePrivacy(.bottom) { (accepted, denied) in
            print("Bottom Privacy Notice completed with results... accepted: \(accepted), denied: \(denied)")
            self.updateLabels()
        }
    }

    @objc func doAlert() {
        self.reset()

        print("PrivacyKit: Presenting Alert Notice")
        requirePrivacy(.alert) { (accepted, denied) in
            print("Alert Privacy Notice completed with results... accepted: \(accepted), denied: \(denied)")
            self.updateLabels()
        }
    }

    @objc func doCustom() {
        self.reset()

        print("PrivacyKit: Presenting Custom Notice")
        requirePrivacy(privacyViewController: CustomNoticeVC()) { (accepted, denied) in
            print("Custom Privacy Notice completed with results... accepted: \(accepted), denied: \(denied)")
            self.updateLabels()
        }
    }

    @objc func reset() {
        print("PrivacyKit: Reset")

        PrivacyKit.shared.setPrivacy(accepted: false)
        PrivacyKit.shared.setPrivacy(denied: false)
        PrivacyKit.shared.setPrivacyRead(read: false)
        PrivacyKit.shared.setTermsRead(read: false)

        self.updateLabels()
    }
}
