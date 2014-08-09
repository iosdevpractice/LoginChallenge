//
//  LoginViewController.swift
//  LoginChallenge
//
//  Created by Wiley Wimberly on 8/6/14.
//  Copyright (c) 2014 Warm Fuzzy Apps, LLC. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var loginView: LoginView! { return self.view as LoginView }
    
    override func loadView() {
        
        view = LoginView()
        loginView.loginButton.addTarget(self, action: Selector("loginTapped"), forControlEvents: UIControlEvents.TouchUpInside)
        loginView.usernameField.becomeFirstResponder()
    }
    
    // MARK: - Actions
    
    func loginTapped() {
        
        if (validate()) {
            let mainViewController = MainViewController()
            let navigationController = UINavigationController()
            navigationController.pushViewController(mainViewController, animated: false)
            presentViewController(navigationController, animated: true) {
                self.loginView.usernameField.text = ""
                self.loginView.passwordField.text = ""
            }
        }
    }
    
    // MARK: - Form validation
    
    func validate() -> Bool {
        
        var validationMessage = ""
        var validationOk = true
        
        let usernameOk = validateUsername(loginView.usernameField.text)
        if !usernameOk {
            validationMessage += "The username must be alphabetic and at least 8 characters. "
            validationOk = false
        }
        
        let passwordOk = validatePassword(loginView.passwordField.text)
        if !passwordOk {
            validationMessage += "The password must be at least 8 characters."
            validationOk = false
        }
        
        if validationOk {
            loginView.messageLabel.text = ""
        } else {
            loginView.messageLabel.text = validationMessage
        }
        return validationOk
    }
 
    func validateUsername(username: String) -> Bool {
        let length = countElements(username)
        let lengthOk = length >= 8
        let testUser = username as NSString
        
        let alpha = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        let userOk = testUser.stringByTrimmingCharactersInSet(alpha) as String == ""
        return lengthOk && userOk
    }
    
    func validatePassword(password: String) -> Bool {
        let length = countElements(password)
        return length >= 8
    }
    
}
