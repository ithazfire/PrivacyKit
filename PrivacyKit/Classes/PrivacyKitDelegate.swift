//
//  PrivacyKitDelegate.swift
//  PrivacyKit
//
//  Created by Jacob Fielding on 7/20/18.
//

import Foundation

public typealias PrivacyCompletion = (() -> Void)

public protocol PrivacyKitDelegate {
    func requirePrivacy(_ viewType: PrivacyNoticeType, completion: (() -> Void)?)
}

extension PrivacyKitDelegate where Self: UIViewController {
    
    /// A View Controller extension to require privacy. This function is placed in the View Controller lifecycle (e.g. viewDidAppear)
    /// To display the privacy notice when your intro view controller loads.
    /// - Parameters:
    ///   - viewType: The View Controller's type. This controls where the PrivacyNotice VIew Controller
    ///               Appears on the screen.
    ///   - completion: The completion to run when the privacy notice is accepted or denied. This allows custom
    ///                 actions to occur when privacy is completed.
    public func requirePrivacy(_ viewType: PrivacyNoticeType = .bottom, completion: PrivacyCompletion? = nil) {
        if PrivacyKit.shared.privacyModel.privacyAccepted == false {
            self.presentPrivacyNotice(viewType, completion: completion)
        }
    }
    
    private func presentPrivacyNotice(_ viewType: PrivacyNoticeType = .bottom, completion: PrivacyCompletion? = nil) {
        var viewController: PrivacyNoticeVC?
        
        switch viewType {
        case .alert:
            return presentAlert()
        case .top:
            viewController = TopNoticeVC()
        case .bottom:
            viewController = BottomNoticeVC()
        }
        
        presentPrivacyNotice(viewController: viewController!, completion: completion)
    }
    
    private func presentPrivacyNotice(viewController: PrivacyNoticeVC, completion: PrivacyCompletion? = nil) {
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .overCurrentContext
        viewController.privacyCompletion = completion
        
        self.present(viewController, animated: true, completion: nil)
    }
    
    private func presentAlert() {
        let alert = UIAlertController(title: "", message: "Message", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
              switch action.style{
              case .default:
                    print("default")
              case .cancel:
                    print("cancel")
              case .destructive:
                    print("destructive")
              @unknown default:
                    fatalError("PrivacyKitDelegate.presentAlert(): Invalid Alert Type")
            }}))
       
        self.present(alert, animated: true, completion: nil)
    }
}
