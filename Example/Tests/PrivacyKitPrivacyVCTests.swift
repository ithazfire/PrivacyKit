//
//  PrivacyKitPrivacyVCTests.swift
//  PrivacyKit_Tests
//
//  Created by Jacob Fielding on 1/18/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Quick
import Nimble
@testable import PrivacyKit

class TestPrivacyKitPrivacyVC: QuickSpec {
    override func spec() {
        it("should run PrivacyNoticeVC viewDidLoad and viewDidLayoutSubviews") {
            let noticeVC = PrivacyNoticeVC()

            /** Excercise the View (Triggers viewDidLoad) **/
            noticeVC.view.isHidden = false

            /** Excercise the View's Layout **/
            noticeVC.view.setNeedsLayout()
            noticeVC.view.layoutIfNeeded()

            expect(noticeVC.view).toEventuallyNot(beNil())
        }

        it("should accept privacy using PrivacyNoticeVC") {
            PrivacyKit.shared.config("https://example.com")
            PrivacyKit.shared.resetState()

            let noticeVC = PrivacyNoticeVC()

            expect(PrivacyKit.shared.privacyAccepted()).to(beFalse())

            noticeVC.acceptPrivacy()

            expect(PrivacyKit.shared.privacyAccepted()).to(beTrue())
        }

        it("should deny privacy using PrivacyNoticeVC") {
            PrivacyKit.shared.config("https://example.com")
            PrivacyKit.shared.resetState()

            let noticeVC = PrivacyNoticeVC()

            expect(PrivacyKit.shared.privacyDenied()).to(beFalse())

            noticeVC.denyPrivacy()

            expect(PrivacyKit.shared.privacyDenied()).to(beTrue())
        }

        it("PrivacyNoticeVC should have an outer/background tap gesture") {
            let noticeVC = PrivacyNoticeVC()
            noticeVC.addDefaultView()

            noticeVC.view.isUserInteractionEnabled = true
            expect(noticeVC.view.gestureRecognizers).toNot(beNil())

            noticeVC.view.touchesBegan(Set<UITouch>(), with: .none)
        }
    }
}
