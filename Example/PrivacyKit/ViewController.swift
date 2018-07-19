//
//  ViewController.swift
//  PrivacyKit
//
//  Created by Archdoog on 07/18/2018.
//  Copyright (c) 2018 Archdoog. All rights reserved.
//

import UIKit
import PrivacyKit

class ViewController: UIViewController {

    let verticalOffset: CGFloat = 128
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.textColor = .black
        label.text = "PrivacyKit"
        label.sizeToFit()
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titleLabel)
        let b = PrivacyKit.shared.testFunction()
        print(b)
    }
    
    override func viewDidAppear(_ animated: Bool) {
 
    }

    override func viewDidLayoutSubviews() {
        titleLabel.frame = CGRect(x: (view.frame.width - titleLabel.frame.width) / 2,
                                  y: (view.frame.height - titleLabel.frame.height) / 2 - verticalOffset,
                                  width: titleLabel.frame.width,
                                  height: titleLabel.frame.height)
    }
}

