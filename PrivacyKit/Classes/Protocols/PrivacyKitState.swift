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
    func acceptPrivacy() {
        privacyModel.privacyAccepted = true
        privacyModel.save()
    }
    
    func denyPrivacy() {
        privacyModel.privacyDenied = true
        privacyModel.save()
    }
    
    func setPrivacy(accepted: Bool) {
        privacyModel.privacyAccepted = accepted
        privacyModel.save()
    }
    
    func setPrivacy(denied: Bool) {
        privacyModel.privacyDenied = denied
        privacyModel.save()
    }
    
    func tapPrivacyPolicy() {
        privacyModel.privacyPolicyRead = true
        privacyModel.save()
    }
    
    func tapTermsOfService() {
        privacyModel.termsOfServiceRead = true
        privacyModel.save()
    }
    
    func setPrivacyRead(read: Bool) {
        privacyModel.privacyPolicyRead = read
        privacyModel.save()
    }
    
    func setTermsRead(read: Bool) {
        privacyModel.termsOfServiceRead = read
        privacyModel.save()
    }
    
    func privacyAccepted() -> Bool {
        return privacyModel.privacyAccepted
    }
    
    func privacyDenied() -> Bool {
        return privacyModel.privacyDenied
    }
    
    func privacyTapped() -> Bool {
        return privacyModel.privacyPolicyRead
    }
    
    func termsTapped() -> Bool {
        return privacyModel.termsOfServiceRead
    }
    
    func getState() -> [String: Any] {
        return [
            "deviceUUID": UIDevice.current.identifierForVendor?.uuidString ?? "",
            "privacyAccepted": self.privacyAccepted(),
            "privacyDenied": self.privacyDenied(),
            "privacyPolicyTapped": self.privacyTapped(),
            "termsOfServiceTapped": self.termsTapped()
        ]
    }
}
