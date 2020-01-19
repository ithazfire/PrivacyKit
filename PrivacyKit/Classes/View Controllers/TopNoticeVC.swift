//
//  TopNoticeVC.swift
//  PrivacyKit
//
//  Created by Jacob Fielding on 7/18/18.
//

import UIKit

class TopNoticeVC: PrivacyNoticeVC {

    let outerHeight: CGFloat = 192
    let innerPadding: CGFloat = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDefaultView()
    }
    
    override func viewDidLayoutSubviews() {        
        backgroundView.frame = CGRect(x: 0,
                                       y: 0,
                                       width: view.frame.width,
                                       height: outerHeight)
        
        var paddingTop: CGFloat = 25
        if #available(iOS 11.0, *) {
            paddingTop = view.safeAreaInsets.top
        }
        
        titleLabel.frame = CGRect(x: padding,
                                  y: paddingTop + innerPadding,
                                  width: view.frame.width - 2 * padding,
                                  height: 20)
        
        descriptionTextView.frame = CGRect(x: padding - 5,
                                           y: titleLabel.frame.maxY + innerPadding,
                                           width: view.frame.width - 2 * padding - 10,
                                           height: 72)
        
        acceptButton.frame = CGRect(x: view.frame.width - acceptButton.frame.width - padding,
                                    y: descriptionTextView.frame.maxY,
                                    width: acceptButton.frame.width + innerPadding,
                                    height: acceptButton.frame.height)
        
        if  PrivacyKit.shared.includeDeny {
            denyButton.frame = CGRect(x: acceptButton.frame.minX - denyButton.frame.width - padding,
                                      y: descriptionTextView.frame.maxY,
                                      width: denyButton.frame.width + innerPadding,
                                      height: denyButton.frame.height)
        }
    }
}
