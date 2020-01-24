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
    }
}
