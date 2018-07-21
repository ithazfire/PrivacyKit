//
//  PrivacyKitFonts.swift
//  PrivacyKit
//
//  Created by Jacob Fielding on 7/20/18.
//

import Foundation

extension PrivacyKitUI {
    struct stringAttributes {
        static let paragraph: [NSAttributedStringKey: Any] = [
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13),
            NSAttributedStringKey.foregroundColor: PrivacyKitUI.colors.basic
        ]
        static let highlights: [NSAttributedStringKey: Any] = [
            NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 13),
            NSAttributedStringKey.foregroundColor: PrivacyKitUI.colors.basic
        ]
    }
}
