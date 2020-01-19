//
//  CustomPrivacyKitStyle.swift
//  PrivacyKit_Example
//
//  Created by Jacob Fielding on 1/18/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import PrivacyKit

public struct CustomPrivacyKitStyle: PrivacyKitStyle {
    public var backgroundColor: UIColor = UIColor(red: 252/255, green: 202/255, blue: 70/255, alpha: 1)
    public var textColor: UIColor = UIColor(red: 35/255, green: 61/255, blue: 77/255, alpha: 1)
    public var buttonHighlightColor: UIColor = UIColor(red: 97/255, green: 155/255, blue: 138/255, alpha: 1)
    public var errorColor: UIColor = UIColor(red: 249/255, green: 87/255, blue: 56/255, alpha: 1)

    public var backgroundCornerRadius: CGFloat = 14

    public var paragraphFont: UIFont = UIFont.systemFont(ofSize: 14)
    public var highlightFont: UIFont = UIFont.boldSystemFont(ofSize: 14)
}
