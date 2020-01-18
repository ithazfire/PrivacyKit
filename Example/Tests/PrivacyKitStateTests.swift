//
//  PrivacyKitStateTests.swift
//  PrivacyKit_Example
//
//  Created by Jacob Fielding on 1/16/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Quick
import Nimble
@testable import PrivacyKit

class TestPrivacyKitStateExtras: QuickSpec {
    override func spec() {
        it("resets the data model state") {
            PrivacyKit.shared.acceptPrivacy()
            PrivacyKit.shared.denyPrivacy()
            PrivacyKit.shared.tapPrivacyPolicy()
            PrivacyKit.shared.tapTermsOfService()

            let state: [String: Any] = PrivacyKit.shared.getState()

            expect(state["termsOfServiceTapped"] as? Bool).to(equal(true))
            expect(state["privacyPolicyTapped"] as? Bool).to(equal(true))
            expect(state["privacyAccepted"] as? Bool).to(equal(true))
            expect(state["privacyDenied"] as? Bool).to(equal(true))

            PrivacyKit.shared.resetState()

            let newState: [String: Any] = PrivacyKit.shared.getState()

            expect(newState["termsOfServiceTapped"] as? Bool).to(equal(false))
            expect(newState["privacyPolicyTapped"] as? Bool).to(equal(false))
            expect(newState["privacyAccepted"] as? Bool).to(equal(false))
            expect(newState["privacyDenied"] as? Bool).to(equal(false))
        }

        it("sets privacy accepted boolean") {
            PrivacyKit.shared.resetState()

            PrivacyKit.shared.setPrivacy(accepted: true)
            expect(PrivacyKit.shared.privacyAccepted()).to(equal(true))

            PrivacyKit.shared.setPrivacy(accepted: false)
            expect(PrivacyKit.shared.privacyAccepted()).to(equal(false))
        }

        it("sets privacy denied boolean") {
            PrivacyKit.shared.resetState()

            PrivacyKit.shared.setPrivacy(denied: true)
            expect(PrivacyKit.shared.privacyDenied()).to(equal(true))

            PrivacyKit.shared.setPrivacy(denied: false)
            expect(PrivacyKit.shared.privacyDenied()).to(equal(false))
        }

        it("sets privacy read boolean") {
            PrivacyKit.shared.resetState()

            PrivacyKit.shared.setPrivacyRead(read: true)
            expect(PrivacyKit.shared.privacyTapped()).to(equal(true))

            PrivacyKit.shared.setPrivacyRead(read: false)
            expect(PrivacyKit.shared.privacyTapped()).to(equal(false))
        }

        it("sets terms read boolean") {
            PrivacyKit.shared.resetState()

            PrivacyKit.shared.setTermsRead(read: true)
            expect(PrivacyKit.shared.termsTapped()).to(equal(true))

            PrivacyKit.shared.setTermsRead(read: false)
            expect(PrivacyKit.shared.termsTapped()).to(equal(false))
        }
    }
}
