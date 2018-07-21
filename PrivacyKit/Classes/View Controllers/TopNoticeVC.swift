//
//  TopNoticeVC.swift
//  FBSnapshotTestCase
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
        
        agreeButton.frame = CGRect(x: self.view.frame.width - agreeButton.frame.width - padding,
                                   y: outerHeight - 30,
                                   width: agreeButton.frame.width,
                                   height: 12)
        
        if manager.includeDeny {
            denyButton.frame = CGRect(x: self.view.frame.width - agreeButton.frame.width - denyButton.frame.width - 2 * padding,
                                      y: outerHeight - 30,
                                      width: denyButton.frame.width,
                                      height: 12)
        }
    }
}
