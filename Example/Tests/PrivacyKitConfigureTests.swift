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

class TestPrivacyKitConfigure: QuickSpec {
    override func spec() {
        it("sets the title") {
            PrivacyKit.shared.setTitle("Custom Privacy Title")

            expect(PrivacyKit.shared.privacyNoticeTitle).to(equal("Custom Privacy Title"))
        }

        it("sets the message") {
            PrivacyKit.shared.config("https://example.com/privacy", "https://example.com/terms")

            PrivacyKit.shared.setMessage("Special message with privacy and terms.",
                                         privacyPolicyLinkText: "privacy",
                                         termsLinkText: "terms")

//            expect(PrivacyKit.shared.getDescription()?.string).to(equal(
//                "Special message with privacy and terms."
//            ))
        }

        it("sets the description") {
            let newDescription = NSMutableAttributedString.init(string: "Special description with Privacy and Terms.")

            PrivacyKit.shared.setDescription(newDescription)

            expect(PrivacyKit.shared.getDescription()?.string).to(equal(
                "Special description with Privacy and Terms."
            ))
        }

        it("toggles include deny") {
            PrivacyKit.shared.disableDeny()
            expect(PrivacyKit.shared.includeDeny).to(equal(false))

            PrivacyKit.shared.enableDeny()
            expect(PrivacyKit.shared.includeDeny).to(equal(true))
        }
    }
}
