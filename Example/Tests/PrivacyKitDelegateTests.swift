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
    var presentedType: UIViewController?
    var presentWasAnimated: Bool?
    var presentHadCompletion: Bool?

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        self.presented = true
        self.presentedType = viewControllerToPresent
    }
}

class TestNoticeVC: PrivacyNoticeVC {

    var presented: Bool?
    var presentedType: UIViewController?
    var presentWasAnimated: Bool?
    var presentHadCompletion: Bool?

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        self.presented = true
        self.presentedType = viewControllerToPresent
    }
}

class TestPrivacyKitDelegate: QuickSpec {
    override func spec() {
        it("is presents the bottom PrivacyNoticeVC") {
            let delegateVC = TestDelegateVC()

            delegateVC.requirePrivacy(.bottom, completion: nil)

            expect(delegateVC.presented).toEventually(beTrue())
        }

        it("is presents the top PrivacyNoticeVC") {
            let delegateVC = TestDelegateVC()

            delegateVC.requirePrivacy(.top, completion: nil)

            expect(delegateVC.presented).toEventually(beTrue())
        }

        it("presents the alert VC") {
            let delegateVC = TestDelegateVC()

            delegateVC.requirePrivacy(.alert, completion: nil)

            expect(delegateVC.presented).toEventually(beTrue())
        }

        it("presents the custom VC") {
            let delegateVC = TestDelegateVC()
            let noticeVC = TestNoticeVC()

            delegateVC.requirePrivacy(privacyViewController: noticeVC, completion: nil)

            expect(delegateVC.presented).toEventually(beTrue())
        }
    }
}
