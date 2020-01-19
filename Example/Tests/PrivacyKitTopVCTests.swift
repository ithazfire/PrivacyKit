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
        it("should run TopNoticeVC viewDidLoad and viewDidLayoutSubviews") {
            let topVC = TopNoticeVC()

            /** Excercise the View (Triggers viewDidLoad) **/
            topVC.view.isHidden = false

            /** Excercise the View's Layout **/
            topVC.view.setNeedsLayout()
            topVC.view.layoutIfNeeded()

            expect(topVC.view).toEventuallyNot(beNil())
        }
    }
}
