//
//  PrivacyKitTopVCTests.swift
//  PrivacyKit_Example
//
//  Created by Jacob Fielding on 1/18/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Quick
import Nimble
@testable import PrivacyKit

class TestPrivacyKitTopVC: QuickSpec {
    override func spec() {
        it("is true truthy") {
            let topVC = TopNoticeVC()
            
            expect(topVC.view).toEventuallyNot(beNil())
        }
    }
}
