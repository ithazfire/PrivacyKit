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
    
    func setPrivacy(accepted: Bool)
    func setPrivacy(denied: Bool)
    
    func tapPrivacyPolicy()
    func tapTermsOfService()
    
    func setPrivacyRead(read: Bool)
    func setTermsRead(read: Bool)
    
    func privacyAccepted() -> Bool
    func privacyDenied() -> Bool
    
    func privacyTapped() -> Bool
    func termsTapped() -> Bool
    
    func getState() -> [String: Any]
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
    
    public func setPrivacy(accepted: Bool) {
        privacyModel.privacyAccepted = accepted
        privacyModel.save()
    }
    
    public func setPrivacy(denied: Bool) {
        privacyModel.privacyDenied = denied
        privacyModel.save()
    }
    
    public func tapPrivacyPolicy() {
        privacyModel.privacyPolicyRead = true
        privacyModel.save()
    }
    
    public func tapTermsOfService() {
        privacyModel.termsOfServiceRead = true
        privacyModel.save()
    }
    
    public func setPrivacyRead(read: Bool) {
        privacyModel.privacyPolicyRead = read
        privacyModel.save()
    }
    
    public func setTermsRead(read: Bool) {
        privacyModel.termsOfServiceRead = read
        privacyModel.save()
    }
    
    public func privacyAccepted() -> Bool {
        return privacyModel.privacyAccepted
    }
    
    public func privacyDenied() -> Bool {
        return privacyModel.privacyDenied
    }
    
    public func privacyTapped() -> Bool {
        return privacyModel.privacyPolicyRead
    }
    
    public func termsTapped() -> Bool {
        return privacyModel.termsOfServiceRead
    }
    
    public func getState() -> [String: Any] {
        return [
            "deviceUUID": UIDevice.current.identifierForVendor?.uuidString ?? "",
            "privacyAccepted": self.privacyAccepted(),
            "privacyDenied": self.privacyDenied(),
            "privacyPolicyTapped": self.privacyTapped(),
            "termsOfServiceTapped": self.termsTapped()
        ]
    }
}
