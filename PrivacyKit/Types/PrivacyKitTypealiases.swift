//
//  PrivacyKitTypealiases.swift
//  PrivacyKit
//
//  Created by Jacob Fielding on 1/18/20.
//

import Foundation

public typealias PrivacyAccepted = Bool
public typealias PrivacyDenied = Bool
public typealias PrivacyCompletion = ((PrivacyAccepted, PrivacyDenied) -> Void)
