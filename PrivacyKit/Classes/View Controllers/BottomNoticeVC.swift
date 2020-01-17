//
//  PrivacyNoticeVC.swift
//  PrivacyKit
//
//  Created by Jacob Fielding on 7/18/18.
//

import UIKit

class BottomNoticeVC: PrivacyNoticeVC {

    let outerHeight: CGFloat = 156
    
    override func viewDidLayoutSubviews() {
        backgroundView.frame = CGRect(x: 0,
                                      y: self.view.frame.height - outerHeight,
                                      width: self.view.frame.width,
                                      height: outerHeight)
        
        titleLabel.frame = CGRect(x: padding,
                                  y: self.view.frame.height - outerHeight + 15,
                                  width: self.view.frame.width - 2 * padding,
                                  height: 20)
        
        descriptionTextView.frame = CGRect(x: padding - 5,
                                           y: self.view.frame.height - outerHeight + 35,
                                           width: self.view.frame.width - 2 * padding - 10,
                                           height: 92)
        
        acceptButton.frame = CGRect(x: self.view.frame.width - acceptButton.frame.width - padding,
                                    y: self.view.frame.height - outerHeight + 20,
                                    width: acceptButton.frame.width,
                                    height: 12)
        
        if PrivacyKit.shared.includeDeny {
            denyButton.frame = CGRect(x: self.view.frame.width - acceptButton.frame.width - denyButton.frame.width - 2 * padding,
                                      y: self.view.frame.height - outerHeight + 20,
                                      width: denyButton.frame.width,
                                      height: 12)
        }
    }
}
