//
//  PrivacyKitBottomVCTests.swift
//  PrivacyKit_Tests
//
//  Created by Jacob Fielding on 1/18/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Quick
import Nimble
@testable import PrivacyKit

class TestPrivacyKitBottomVC: QuickSpec {
    override func spec() {
        it("should run BottomNoticeVC viewDidLoad and viewDidLayoutSubviews") {
            let bottomVC = BottomNoticeVC()

            /** Excercise the View (Triggers viewDidLoad) **/
            bottomVC.view.isHidden = false

            /** Excercise the View's Layout **/
            bottomVC.view.setNeedsLayout()
            bottomVC.view.layoutIfNeeded()

            expect(bottomVC.view).toEventuallyNot(beNil())
        }
    }
}
