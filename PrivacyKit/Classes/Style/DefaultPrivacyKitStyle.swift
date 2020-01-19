//
//  DefaultPrivacyKitStyle.swift
//  FBSnapshotTestCase
//
//  Created by Jacob Fielding on 1/18/20.
//

import UIKit

public struct DefaultPrivacyKitStyle: PrivacyKitStyle {
    public var backgroundColor: UIColor = UIColor(red: 37/255, green: 39/255, blue: 46/255, alpha: 1)
    public var textColor: UIColor = UIColor(red: 242/255, green: 239/255, blue: 234/255, alpha: 1)
    public var buttonHighlightColor: UIColor = UIColor(red: 242/255, green: 239/255, blue: 234/255, alpha: 0.3)
    public var errorColor: UIColor = UIColor(red: 37/255, green: 39/255, blue: 46/255, alpha: 0.1)

    public var backgroundCornerRadius: CGFloat = 0

    public var paragraphFont: UIFont = UIFont.systemFont(ofSize: 13)
    public var highlightFont: UIFont = UIFont.boldSystemFont(ofSize: 13)
}
