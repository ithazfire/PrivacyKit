//
//  PrivacyKitStyle.swift
//  PrivacyKit
//
//  Created by Jacob Fielding on 7/20/18.
//

import Foundation

public protocol PrivacyKitStyle {
    func getLinkTextAttributes() -> [String: Any]
}

extension PrivacyKitStyle where Self: PrivacyKit {
    public func getLinkTextAttributes() -> [String: Any] {
        return [
            NSAttributedStringKey.font.rawValue: self.highlightAttr[NSAttributedStringKey.font],
            NSAttributedStringKey.foregroundColor.rawValue: self.highlightAttr[NSAttributedStringKey.foregroundColor]
        ]
    }
}
