//
//  PrivacyKitErrors.swift
//  PrivacyKit
//
//  Created by Jacob Fielding on 7/20/18.
//

import Foundation

enum PrivacyKitError: Error {
    case noPrivacyPolicyLink
    case noTermsOfServiceLink
    case noPrivacyPolicyTextMatched
    case noTermsOfServiceLinkMatched
}
