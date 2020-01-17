//
//  PrivacyKitStyle.swift
//  PrivacyKit
//
//  Created by Jacob Fielding on 7/20/18.
//

import Foundation

public protocol PrivacyKitStyle {
    func getLinkTextAttributes() -> [NSAttributedString.Key: Any]
}

public extension PrivacyKitStyle where Self: PrivacyKit {
    func getLinkTextAttributes() -> [NSAttributedString.Key: Any] {
        return [
            NSAttributedString.Key.font:
                self.highlightAttr[NSAttributedString.Key.font]!,
            NSAttributedString.Key.foregroundColor:
                self.highlightAttr[NSAttributedString.Key.foregroundColor]!
        ]
    }
}
