//
//  PrivacyKitDescription.swift
//  PrivacyKit
//
//  Created by Jacob Fielding on 7/18/18.
//

import Foundation

extension PrivacyKit {
    
    public func getDescription() -> NSMutableAttributedString? {
        return self.descriptionAttributed
    }
    
    internal func buildDescription() {
        self.descriptionParts = self.splitMessage()
        self.descriptionAttributed = self.getAttributed()
        self.bindLinks()
    }
    
    private func splitMessage() -> [String]? {
        if self.termsOfServiceLink != nil {
            if let privacyTextRange = self.termsOfServiceDescription.range(of: self.privacyPolicyText),
                let termsTextRange = self.termsOfServiceDescription.range(of: self.termsOfServiceText) {
                
                if privacyTextRange.lowerBound > termsTextRange.upperBound {
                    self.descriptionParts = [
                        String(self.termsOfServiceDescription[..<termsTextRange.lowerBound]),
                        String(self.termsOfServiceDescription[termsTextRange.lowerBound..<termsTextRange.upperBound]),
                        String(self.termsOfServiceDescription[termsTextRange.upperBound..<privacyTextRange.lowerBound]),
                        String(self.termsOfServiceDescription[privacyTextRange.lowerBound..<privacyTextRange.upperBound]),
                        String(self.termsOfServiceDescription[privacyTextRange.upperBound...])
                    ]
                }
                return [
                    String(self.termsOfServiceDescription[..<privacyTextRange.lowerBound]),
                    String(self.termsOfServiceDescription[privacyTextRange.lowerBound..<privacyTextRange.upperBound]),
                    String(self.termsOfServiceDescription[privacyTextRange.upperBound..<termsTextRange.lowerBound]),
                    String(self.termsOfServiceDescription[termsTextRange.lowerBound..<termsTextRange.upperBound]),
                    String(self.termsOfServiceDescription[termsTextRange.upperBound...])
                ]
            }
        }

        if let privacyTextRange = self.privacyDescription.range(of: self.privacyPolicyText) {
            return [
                String(self.privacyDescription[..<privacyTextRange.lowerBound]),
                String(self.privacyDescription[privacyTextRange.lowerBound..<privacyTextRange.upperBound]),
                String(self.privacyDescription[privacyTextRange.upperBound...])
            ]
        }
        
        return nil
    }
    
    private func getAttributed() -> NSMutableAttributedString {
        let description = NSMutableAttributedString(string: String(""))
        if let parts = self.descriptionParts {
            for part in parts {
                var attributes: [NSAttributedStringKey: Any] = self.paragraphAttr
                if part == privacyPolicyText || part == termsOfServiceText {
                    attributes = self.highlightAttr
                }
                description.append(
                    NSMutableAttributedString(
                        string: part,
                        attributes: attributes
                    )
                )
            }
        }
        
        return description
    }
    
    private func bindLinks() {
        if let privacyTextRange = self.descriptionAttributed?.mutableString.range(of: self.privacyPolicyText) {
            self.descriptionAttributed?.addAttribute(.link, value: self.privacyPolicyLink, range: privacyTextRange)
        }
        
        if let termsOfServiceLink = self.descriptionAttributed?.mutableString.range(of: self.termsOfServiceText) {
            self.descriptionAttributed?.addAttribute(.link, value: self.termsOfServiceLink, range: termsOfServiceLink)
        }
    }
}
