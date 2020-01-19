//
//  PrivacyKitStyle.swift
//  FBSnapshotTestCase
//
//  Created by Jacob Fielding on 1/18/20.
//

import Foundation

public protocol PrivacyKitStyle {
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
    var buttonHighlightColor: UIColor { get }
    var errorColor: UIColor { get }

    var backgroundCornerRadius: CGFloat { get }

    var paragraphFont: UIFont { get }
    var highlightFont: UIFont { get }

    var paragraphAttrText: [NSAttributedString.Key: Any] { get }
    var highlightsAttrText: [NSAttributedString.Key: Any] { get }
}

extension PrivacyKitStyle {
    public var paragraphAttrText: [NSAttributedString.Key: Any] {
        get {
            return [
                NSAttributedString.Key.font: self.paragraphFont,
                NSAttributedString.Key.foregroundColor: self.textColor
            ]
        }
    }
    public var highlightsAttrText: [NSAttributedString.Key: Any] {
        get {
            return [
                NSAttributedString.Key.font: self.highlightFont,
                NSAttributedString.Key.foregroundColor: self.textColor
            ]
        }
    }
}
