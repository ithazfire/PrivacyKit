//
//  AppDelegate.swift
//  PrivacyKit
//
//  Created by Archdoog on 07/18/2018.
//  Copyright (c) 2018 Archdoog. All rights reserved.
//

import UIKit
import PrivacyKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        /** Configure PrivacyKit Globally */
        // PrivacyKit.shared.config("https://github.com/ithazfire/PrivacyKit")
        // PrivacyKit.shared.config("https://github.com/ithazfire/PrivacyKit", "https://github.com/ithazfire/PrivacyKit/wiki")

        return true
    }
}
