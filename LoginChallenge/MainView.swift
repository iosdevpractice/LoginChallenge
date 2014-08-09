//
//  MainView.swift
//  LoginChallenge
//
//  Created by Wiley Wimberly on 8/8/14.
//  Copyright (c) 2014 Warm Fuzzy Apps, LLC. All rights reserved.
//

import UIKit

class MainView: UIView {

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        imageView.contentMode = .ScaleAspectFit
        imageView.image = UIImage(named: "feet")
        imageView.userInteractionEnabled = true
        return imageView
    }()

    // MARK: - Initialization

    convenience override init() {
        self.init(frame: UIScreen.mainScreen().bounds)
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    // MARK: - Helpers
    func configure() {
        backgroundColor = UIColor.lightGrayColor()

        addSubview(imageView)

        let views = ["image": imageView]

        for format in [
            "|-0-[image]-0-|",
            "V:|-0-[image]-0-|"
        ] {
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: nil, metrics: nil, views: views))
        }
    }

}
