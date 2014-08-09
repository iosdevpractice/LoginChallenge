//
//  LoginView.swift
//  LoginChallenge
//
//  Created by Wiley Wimberly on 8/8/14.
//  Copyright (c) 2014 Warm Fuzzy Apps, LLC. All rights reserved.
//

import UIKit

class LoginView: UIView {

    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        titleLabel.text = "Awesome App"
        titleLabel.textAlignment = .Center
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = titleLabel.font.fontWithSize(24)
        return titleLabel
    }()

    lazy var usernameField: UITextField = {
        return self.setupTextFieldWithPlaceholder("username")
    }()

    lazy var passwordField: UITextField = {
        let passwordField = self.setupTextFieldWithPlaceholder("password")
        passwordField.secureTextEntry = true
        return passwordField
    }()

    lazy var loginButton: UIButton = {
        let loginButton = UIButton.buttonWithType(.System) as UIButton
        loginButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        loginButton.setTitle("Login", forState: .Normal)
        loginButton.backgroundColor = UIColor.whiteColor()
        return loginButton
    }()

    lazy var messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        messageLabel.textAlignment = .Center
        messageLabel.textColor = UIColor.redColor()
        messageLabel.lineBreakMode = .ByWordWrapping;
        messageLabel.numberOfLines = 0;
        return messageLabel
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
        
        addSubview(titleLabel)
        addSubview(usernameField)
        addSubview(passwordField)
        addSubview(loginButton)
        addSubview(messageLabel)
        
        let views = ["titleLabel": titleLabel, "username": usernameField, "password": passwordField, "login": loginButton, "messageLabel": messageLabel]
        
        let metrics = ["tspace": 20, "hspace": 25, "vspace": 15, "height": 35]
    
        let options = NSLayoutFormatOptions.AlignAllCenterX
        
        for format in [
            "|-hspace-[titleLabel]-hspace-|",
            "|-hspace-[username]-hspace-|",
            "|-hspace-[password]-hspace-|",
            "|-hspace-[login]-hspace-|",
            "|-hspace-[messageLabel]-hspace-|",
            "V:|-tspace-[titleLabel(height)]-vspace-[username(height)]-vspace-[password(height)]-vspace-[login(height)]-vspace-[messageLabel(>=height)]"
        ] {
            addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: options, metrics: metrics, views: views))
        }
    }
    
    func setupTextFieldWithPlaceholder(placeholder: String) -> UITextField {
        let field = UITextField()
        field.setTranslatesAutoresizingMaskIntoConstraints(false)
        field.backgroundColor = UIColor.whiteColor()
        field.leftViewMode = .Always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        field.placeholder = placeholder
        return field
    }

}
