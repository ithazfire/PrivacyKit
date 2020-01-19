//
//  PrivacyKitDelegate.swift
//  PrivacyKit
//
//  Created by Jacob Fielding on 7/20/18.
//

import Foundation

public typealias PrivacyAccepted = Bool
public typealias PrivacyDenied = Bool
public typealias PrivacyCompletion = ((PrivacyAccepted, PrivacyDenied) -> Void)

public protocol PrivacyKitDelegate {
    func requirePrivacy(_ viewType: PrivacyNoticeType, _ completion: PrivacyCompletion?)
    func requirePrivacy(privacyViewController: PrivacyNoticeVC, _ completion: PrivacyCompletion?)
}

extension PrivacyKitDelegate where Self: UIViewController {
    
    /// A View Controller extension to require privacy. This function is placed in the
    /// View Controller lifecycle (e.g. viewDidAppear) To display the privacy notice
    /// when your intro view controller loads.
    /// - Parameters:
    ///   - viewType: The View Controller's type. This controls where the PrivacyNotice
    ///               View Controller Appears on the screen.
    ///   - completion: The completion to run when the privacy notice is accepted or denied.
    ///                 This allows custom actions to occur when privacy is completed.
    public func requirePrivacy(_ viewType: PrivacyNoticeType = .bottom, _ completion: PrivacyCompletion? = nil) {
        if PrivacyKit.shared.privacyModel.privacyAccepted == false {
            self.presentPrivacyNotice(viewType, completion)
        }
    }
    
    public func requirePrivacy(privacyViewController: PrivacyNoticeVC, _ completion: PrivacyCompletion? = nil) {
        if PrivacyKit.shared.privacyModel.privacyAccepted == false {
            self.presentPrivacyNotice(viewController: privacyViewController, completion)
        }
    }
    
    private func presentPrivacyNotice(_ viewType: PrivacyNoticeType = .bottom, _ completion: PrivacyCompletion? = nil) {
        var viewController: PrivacyNoticeVC?
        
        switch viewType {
        case .alert:
            return presentAlert(completion: completion)
        case .top:
            viewController = TopNoticeVC()
        case .bottom:
            viewController = BottomNoticeVC()
        }
        
        presentPrivacyNotice(viewController: viewController!)
    }
    
    private func presentPrivacyNotice(viewController: PrivacyNoticeVC, _ completion: PrivacyCompletion? = nil) {
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .overCurrentContext
        viewController.privacyCompletion = completion
        
        self.present(viewController, animated: true, completion: nil)
    }
    
    private func presentAlert(completion: PrivacyCompletion? = nil) {
        let alert = UIAlertController()
        
        alert.title = PrivacyKit.shared.privacyNoticeTitle
        alert.message = PrivacyKit.shared.descriptionAttributed!.string
        
        let acceptAction = UIAlertAction(title: "Accept Privacy", style: .default) { (action) in
            PrivacyKit.shared.acceptPrivacy()
            completion?(PrivacyKit.shared.privacyAccepted(), PrivacyKit.shared.privacyDenied())
        }
        
        let denyAction = UIAlertAction(title: "Deny Privacy", style: .destructive) { (action) in
            PrivacyKit.shared.denyPrivacy()
            completion?(PrivacyKit.shared.privacyAccepted(), PrivacyKit.shared.privacyDenied())
        }
        
        alert.addAction(acceptAction)
        alert.addAction(denyAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}
