//
//  CustomNoticeVC.swift
//  PrivacyKit_Example
//
//  Created by Jacob Fielding on 1/18/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import PrivacyKit

class CustomNoticeVC: PrivacyNoticeVC {

    let outerPadding: CGFloat = 30
    let padding: CGFloat = 15

    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.92, green: 0.92, blue: 0.92, alpha: 1)
        return view
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Agree to the privacy policy."
        label.numberOfLines = 2
        return label
    }()
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = """
        We handle your privacy this way.
        Accept to continue.
        """
        label.numberOfLines = 0
        return label
    }()

    let acceptButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "check"), for: .normal)
        return button
    }()
    let denyButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cancel"), for: .normal)
        button.tintColor = .red
        return button
    }()

    override public func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(backgroundView)

        backgroundView.addSubview(titleLabel)
        backgroundView.addSubview(descriptionLabel)
        backgroundView.addSubview(acceptButton)
        backgroundView.addSubview(denyButton)

        acceptButton.addTarget(self, action: #selector(PrivacyNoticeVC.acceptPrivacy), for: .touchUpInside)
        denyButton.addTarget(self, action: #selector(PrivacyNoticeVC.denyPrivacy), for: .touchUpInside)
    }

    override public func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        var topOffset: CGFloat = 0
        var bottomOffset: CGFloat = 0

        if #available(iOS 11.0, *) {
            topOffset = view.safeAreaInsets.top
            bottomOffset = view.safeAreaInsets.bottom
        }

        backgroundView.frame = CGRect(x: outerPadding,
                                      y: topOffset + padding,
                                      width: view.frame.width - outerPadding * 2,
                                      height: view.frame.height - topOffset - bottomOffset - padding * 2)

        titleLabel.frame = CGRect(x: padding,
                                  y: padding,
                                  width: backgroundView.frame.width - padding * 2,
                                  height: 120)

        let size = descriptionLabel.sizeThatFits(
            CGSize(width: backgroundView.frame.width - padding * 2, height: 250))

        descriptionLabel.frame = CGRect(x: padding,
                                        y: titleLabel.frame.maxY + padding,
                                        width: size.width,
                                        height: size.height)

        acceptButton.frame = CGRect(x: backgroundView.frame.width - padding - 24,
                                    y: backgroundView.frame.height - padding - 24,
                                    width: 24,
                                    height: 24)

        denyButton.frame = CGRect(x: acceptButton.frame.minX - 24 - padding,
                                  y: backgroundView.frame.height - padding - 24,
                                  width: 24,
                                  height: 24)
    }
}
