//
//  PrivacyKitFonts.swift
//  PrivacyKit
//
//  Created by Jacob Fielding on 7/20/18.
//

import Foundation

public extension PrivacyKitUI {
    struct stringAttributes {
        static let paragraph: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),
            NSAttributedString.Key.foregroundColor: PrivacyKitUI.colors.basic
        ]
        static let highlights: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13),
            NSAttributedString.Key.foregroundColor: PrivacyKitUI.colors.basic
        ]
    }
}
