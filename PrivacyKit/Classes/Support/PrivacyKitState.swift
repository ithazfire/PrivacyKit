//
//  PrivacyKitState.swift
//  PrivacyKit
//
//  Created by Jacob Fielding on 7/20/18.
//

import Foundation

public protocol PrivacyKitState {
    func acceptPrivacy()
    func denyPrivacy()
    
    func privacyAccepted() -> Bool
    func privacyDenied() -> Bool
    
    func privacyClicked() -> Bool
    func termsClicked() -> Bool
}

public extension PrivacyKitState where Self: PrivacyKit {
    public func acceptPrivacy() {
        privacyModel.privacyAccepted = true
        privacyModel.save()
    }
    
    public func denyPrivacy() {
        privacyModel.privacyDenied = true
        privacyModel.save()
    }
    
    public func privacyAccepted() -> Bool {
        return privacyModel.privacyAccepted
    }
    
    public func privacyDenied() -> Bool {
        return privacyModel.privacyDenied
    }
    
    public func privacyClicked() -> Bool {
        return privacyModel.privacyPolicyRead
    }
    
    public func termsClicked() -> Bool {
        return privacyModel.termsOfServiceRead
    }
}
