//
//  MainViewController.swift
//  LoginChallenge
//
//  Created by Wiley Wimberly on 8/8/14.
//  Copyright (c) 2014 Warm Fuzzy Apps, LLC. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var mainView: MainView! { return self.view as MainView }
    
    override func loadView() {
    
        view = MainView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .Done, target: self, action: Selector("logoutTapped"))
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: Selector("imageTapped:"))
        mainView.imageView.addGestureRecognizer(tapRecognizer)
    }
    
    // MARK: - Actions
    
    func logoutTapped() {
        presentingViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .Ended {

            showMessage()
        }
    }
    
    // MARK: - Helpers
    
    func showMessage() {
        
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        
        messageLabel.text = "Hello World"
        messageLabel.textColor = UIColor.whiteColor()
        messageLabel.font = messageLabel.font.fontWithSize(24)
        messageLabel.alpha = 0.0
        messageLabel.sizeToFit()
        
        let width = mainView.bounds.size.width - messageLabel.bounds.size.width
        let height = mainView.bounds.size.height - messageLabel.bounds.size.height - 100
        
        let x = CGFloat(arc4random() % UInt32(width))
        let y = CGFloat(arc4random() % UInt32(height)) + 100.0
        
        var frame = messageLabel.frame
        frame.origin = CGPoint(x: x, y: y)
        
        mainView.addSubview(messageLabel)
        
        let delay = 2.5 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options: nil, animations: {
                messageLabel.frame = frame
                messageLabel.alpha = 1.0
            }, completion: { finished in
                dispatch_after(time, dispatch_get_main_queue(), {
                    messageLabel.removeFromSuperview()
                })
            })
    }

}
