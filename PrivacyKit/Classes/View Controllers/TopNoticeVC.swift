//
//  TopNoticeVC.swift
//  PrivacyKit
//
//  Created by Jacob Fielding on 7/18/18.
//

import UIKit

class TopNoticeVC: PrivacyNoticeVC {

    let outerHeight: CGFloat = 156
    
    override func viewDidLayoutSubviews() {
        backgroundView.frame = CGRect(x: 0,
                                      y: 0,
                                      width: self.view.frame.width,
                                      height: outerHeight)
        
        titleLabel.frame = CGRect(x: padding,
                                  y: 50,
                                  width: self.view.frame.width - 2 * padding,
                                  height: 20)
        
        descriptionTextView.frame = CGRect(x: padding - 5,
                                           y: 70,
                                           width: self.view.frame.width - 2 * padding - 10,
                                           height: 92)
        
        acceptButton.frame = CGRect(x: self.view.frame.width - acceptButton.frame.width - padding,
                                    y: outerHeight - 30,
                                    width: acceptButton.frame.width,
                                    height: 12)
        
        if  PrivacyKit.shared.includeDeny {
            denyButton.frame = CGRect(x: self.view.frame.width - acceptButton.frame.width - denyButton.frame.width - 2 * padding,
                                      y: outerHeight - 30,
                                      width: denyButton.frame.width,
                                      height: 12)
        }
    }
}
