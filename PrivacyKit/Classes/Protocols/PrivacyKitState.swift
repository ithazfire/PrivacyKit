//
//  PrivacyKitState.swift
//  PrivacyKit
//
//  Created by Jacob Fielding on 7/20/18.
//

import Foundation

public protocol PrivacyKitState {
    func acceptPrivacy(_ completion: PrivacyCompletion?)
    func denyPrivacy(_ completion: PrivacyCompletion?)

    func tapPrivacyPolicy()
    func tapTermsOfService()

    func privacyAccepted() -> Bool
    func privacyDenied() -> Bool

    func privacyTapped() -> Bool
    func termsTapped() -> Bool

    func resetState()
    func getState() -> [String: Any]
}

public extension PrivacyKitState where Self: PrivacyKit {
    func acceptPrivacy(_ completion: PrivacyCompletion? = nil) {
        let accepted = true
        self.setPrivacy(accepted: accepted)
        completion?(.success(accepted))
    }

    func denyPrivacy(_ completion: PrivacyCompletion? = nil) {
        let denied = true
        self.setPrivacy(denied: denied)
        completion?(.failure(PrivacyKitError.privacyDenied))
    }

    func tapPrivacyPolicy() {
        self.setPrivacyRead(read: true)
    }

    func tapTermsOfService() {
        self.setTermsRead(read: true)
    }

    private func setPrivacy(accepted: Bool) {
        privacyModel.privacyAccepted = accepted
        privacyModel.save()
    }

    private func setPrivacy(denied: Bool) {
        privacyModel.privacyDenied = denied
        privacyModel.save()
    }
    
    private func setPrivacyRead(read: Bool) {
        privacyModel.privacyPolicyRead = read
        privacyModel.save()
    }

    private func setTermsRead(read: Bool) {
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

    func resetState() {
        privacyModel.privacyAccepted = false
        privacyModel.privacyDenied = false
        privacyModel.termsOfServiceRead = false
        privacyModel.privacyPolicyRead = false
        privacyModel.save()
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
