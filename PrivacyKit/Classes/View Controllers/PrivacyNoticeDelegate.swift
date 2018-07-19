//
//  PrivacyNoticeVCProto.swift
//  FBSnapshotTestCase
//
//  Created by Jacob Fielding on 7/18/18.
//

import Foundation

public protocol PrivacyNoticeDelegate {
    func agreedToPrivacy(userPressed agreement: Bool)
}
