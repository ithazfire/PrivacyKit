//
//  PrivacyKitDelegateCompTests.swift
//  PrivacyKit_Example
//
//  Created by Jacob Fielding on 1/24/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Quick
import Nimble
@testable import PrivacyKit

class TestPrivacyKitDelegateCompletion: QuickSpec {
    override func spec() {
        it("runs completion when accepted") {
            let delegateVC = TestDelegateVC()
            let noticeVC = TestNoticeVC()

            var success: Bool = false

            delegateVC.requirePrivacy(privacyViewController: noticeVC) { _ in
                success = true
            }

            noticeVC.acceptPrivacy()

            expect(success).toEventually(beTrue())
        }

        it("doesn't run completion when no accept") {
            let delegateVC = TestDelegateVC()
            let noticeVC = TestNoticeVC()

            delegateVC.requirePrivacy(privacyViewController: noticeVC) { _ in
                fail("closure shouldn't run")
            }
        }
    }
}
