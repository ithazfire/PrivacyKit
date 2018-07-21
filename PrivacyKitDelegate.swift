//
//  PrivacyKitDelegate.swift
//  PrivacyKit
//
//  Created by Jacob Fielding on 7/20/18.
//

import Foundation

public protocol PrivacyKitDelegate {
    func requirePrivacy(_ viewType: PrivacyNoticeType, completion: (() -> Void)?)
}

extension PrivacyKitDelegate where Self: UIViewController {
    
    public func requirePrivacy(_ viewType: PrivacyNoticeType = .bottom, completion: (() -> Void)? = nil) {
        print("PrivacyKit: requiring privacy")
        
        if PrivacyKit.shared.privacyModel.privacyAccepted == false {
            print("PrivacyKit: presenting privacy dialog")
            self.presentPrivacyNotice(viewType, completion: completion)
        }
    }
    
    private func presentPrivacyNotice(_ viewType: PrivacyNoticeType = .bottom, completion: (() -> Void)? = nil) {
        var viewController: PrivacyNoticeVC?
        
        switch viewType {
        case .alert:
            viewController = AlertNoticeVC()
        case .top:
            viewController = TopNoticeVC()
        case .center:
            viewController = CenterNoticeVC()
        case .bottom:
            viewController = BottomNoticeVC()
        }
        
        viewController!.modalTransitionStyle = .crossDissolve
        viewController!.modalPresentationStyle = .overCurrentContext
        self.present(viewController!, animated: true, completion: completion)
    }
}
