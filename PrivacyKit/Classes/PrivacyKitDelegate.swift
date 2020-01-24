//
//  PrivacyKitDelegate.swift
//  PrivacyKit
//
//  Created by Jacob Fielding on 7/20/18.
//

import Foundation

public typealias PrivacyAccepted = Bool
public typealias PrivacyDenied = Bool
public typealias PrivacyCompletion = (Result<PrivacyAccepted, Error>) -> Void

public protocol PrivacyKitDelegate {
    func requirePrivacy(_ viewType: PrivacyNoticeType, _ completion: PrivacyCompletion?)
    func requirePrivacy(privacyViewController: PrivacyNoticeVC, _ completion: PrivacyCompletion?)
}

extension PrivacyKitDelegate where Self: UIViewController {

    /// Require privacy using a prebuilt Privacy Notice. This function is placed in the
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
    
    /// Require Privacy using a custom Privacy Notice. Your custom Privacy Notice View Controller
    /// should implement the `PrivacyNoticeVC` class. It also needs to appropriately bind
    /// the `PrivacyNoticeVC.acceptPrivacy` and `PrivacyNoticeVC.denyPrivacy`
    /// `@objc` methods or handle accepting and deny privacy manually in it's own methods.
    /// - Parameters:
    ///   - privacyViewController: A custom view controller for your privacy
    ///   - completion: The privacy completion runs when the user selects Agree or Deny
    ///     If the View Controller is using the default accept and deny `@objc` functions.
    public func requirePrivacy(privacyViewController: PrivacyNoticeVC, _ completion: PrivacyCompletion? = nil) {
        if PrivacyKit.shared.privacyModel.privacyAccepted == false {
            self.presentPrivacyNotice(viewController: privacyViewController, completion: completion)
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

        presentPrivacyNotice(viewController: viewController!, completion: completion)
    }

    private func presentPrivacyNotice(viewController: PrivacyNoticeVC, completion: PrivacyCompletion?) {
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .overCurrentContext
        viewController.privacyCompletion = completion

        self.present(viewController, animated: true, completion: nil)
    }

    private func presentAlert(completion: PrivacyCompletion?) {
        let alert = UIAlertController()

        alert.title = PrivacyKit.shared.privacyNoticeTitle
        alert.message = PrivacyKit.shared.descriptionAttributed!.string

        let acceptAction = UIAlertAction(title: "Accept Privacy", style: .default) { (_) in
            PrivacyKit.shared.acceptPrivacy(completion)
        }

        let denyAction = UIAlertAction(title: "Deny Privacy", style: .destructive) { (_) in
            PrivacyKit.shared.denyPrivacy(completion)
        }

        alert.addAction(acceptAction)
        alert.addAction(denyAction)

        self.present(alert, animated: true, completion: nil)
    }
}
