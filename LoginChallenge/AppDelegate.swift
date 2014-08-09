//
//  AppDelegate.swift
//  LoginChallenge
//
//  Created by Wiley Wimberly on 8/6/14.
//  Copyright (c) 2014 Warm Fuzzy Apps, LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?

    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        
        let loginViewController = LoginViewController()
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window!.rootViewController = loginViewController
        window!.backgroundColor = UIColor.whiteColor()
        window!.makeKeyAndVisible()
        
        return true
    }
}

