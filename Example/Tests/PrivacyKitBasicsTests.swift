//
//  PrivacyKitConfigureTests.swift
//  PrivacyKit_Example
//
//  Created by Jacob Fielding on 1/16/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Quick
import Nimble
@testable import PrivacyKit

class TestPrivacyKitBasics: QuickSpec {
    override func spec() {
        it("will check the default description") {
            PrivacyKit.shared.config("https://example.com/privacy")

            expect(PrivacyKit.shared.getDescription()?.string).to(equal(
                """
                This App collects personally identifyable data as outlined in the Privacy Policy \
                and includes a Terms of Service. By continuing to use the app you consent to \
                the policy and terms.
                """
            ))
        }

        it("resets the state to all falsy") {
            PrivacyKit.shared.resetState()

            let state: [String: Any] = PrivacyKit.shared.getState()

            expect(state["termsOfServiceTapped"] as? Bool).to(equal(false))
            expect(state["privacyPolicyTapped"] as? Bool).to(equal(false))
            expect(state["privacyAccepted"] as? Bool).to(equal(false))
            expect(state["privacyDenied"] as? Bool).to(equal(false))
        }

        it("accepts the privacy") {
            PrivacyKit.shared.resetState()
            expect(PrivacyKit.shared.privacyAccepted()).to(equal(false))

            PrivacyKit.shared.acceptPrivacy()
            expect(PrivacyKit.shared.privacyAccepted()).to(equal(true))
        }

        it("denies the privacy") {
            PrivacyKit.shared.resetState()
            expect(PrivacyKit.shared.privacyDenied()).to(equal(false))

            PrivacyKit.shared.denyPrivacy()
            expect(PrivacyKit.shared.privacyDenied()).to(equal(true))
        }

        it("sets the privacy link to tapped") {
            PrivacyKit.shared.resetState()
            expect(PrivacyKit.shared.privacyTapped()).to(equal(false))

            PrivacyKit.shared.tapPrivacyPolicy()
            expect(PrivacyKit.shared.privacyTapped()).to(equal(true))
        }

        it("sets the terms of service link to tapped") {
            PrivacyKit.shared.resetState()
            expect(PrivacyKit.shared.termsTapped()).to(equal(false))

            PrivacyKit.shared.tapTermsOfService()
            expect(PrivacyKit.shared.termsTapped()).to(equal(true))
        }
    }
}
