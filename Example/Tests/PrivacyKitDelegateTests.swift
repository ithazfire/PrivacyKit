//
//  PrivacyKitDelegateTests.swift
//  PrivacyKit_Example
//
//  Created by Jacob Fielding on 1/17/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Quick
import Nimble
@testable import PrivacyKit

class TestDelegateVC: UIViewController, PrivacyKitDelegate {

    var presented: Bool?
    var presentedNoticeVC: PrivacyNoticeVC?
    var presentedAlertVC: UIAlertController?
    var presentWasAnimated: Bool?
    var presentHadCompletion: Bool?

    override func present(_ viewControllerToPresent: UIViewController,
                          animated flag: Bool,
                          completion: (() -> Void)? = nil) {
        /** Run the Layout Functions to Ensure the Presented View Layout Subs Works **/
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()

        self.presented = true
        self.presentedNoticeVC = viewControllerToPresent as? PrivacyNoticeVC
        self.presentedAlertVC = viewControllerToPresent as? UIAlertController
        self.presentWasAnimated = flag
        self.presentHadCompletion = completion != nil
    }
}

class TestNoticeVC: PrivacyNoticeVC {

    var dismissed: Bool?
    var dismissWasAnimated: Bool?
    var dismissHadCompletion: Bool?

    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        self.dismissed = true
        self.dismissWasAnimated = flag
        self.dismissHadCompletion = completion != nil
    }
}

class TestPrivacyKitDelegate: QuickSpec {
    override func spec() {
        it("is presents the bottom PrivacyNoticeVC") {
            let delegateVC = TestDelegateVC()

            PrivacyKit.shared.config("https://example.com")
            PrivacyKit.shared.resetState()

            delegateVC.requirePrivacy(.bottom)

            expect(delegateVC.presented).toEventually(beTrue())
            expect(delegateVC.presentedNoticeVC).toEventually(beAnInstanceOf(BottomNoticeVC.self))
        }

        it("is presents the top PrivacyNoticeVC") {
            let delegateVC = TestDelegateVC()

            PrivacyKit.shared.config("https://example.com")
            PrivacyKit.shared.resetState()

            delegateVC.requirePrivacy(.top)

            expect(delegateVC.presented).toEventually(beTrue())
            expect(delegateVC.presentedNoticeVC).toEventually(beAnInstanceOf(TopNoticeVC.self))
        }

        it("presents the alert VC") {
            let delegateVC = TestDelegateVC()

            PrivacyKit.shared.config("https://example.com")
            PrivacyKit.shared.resetState()

            delegateVC.requirePrivacy(.alert)

            expect(delegateVC.presented).toEventually(beTrue())
            expect(delegateVC.presentedAlertVC).toEventually(beAnInstanceOf(UIAlertController.self))
        }

        it("presents the custom VC") {
            let delegateVC = TestDelegateVC()
            let noticeVC = TestNoticeVC()

            PrivacyKit.shared.config("https://example.com")
            PrivacyKit.shared.resetState()

            delegateVC.requirePrivacy(privacyViewController: noticeVC)

            expect(delegateVC.presented).toEventually(beTrue())
            expect(delegateVC.presentedNoticeVC).toEventually(beAnInstanceOf(TestNoticeVC.self))
        }
    }
}
