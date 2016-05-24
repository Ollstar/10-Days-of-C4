//
//  ViewController.swift
//  LoginAnimation
//
//  Created by Oliver Andrews on 2016-05-21.
//  Copyright © 2016 Oliver Andrews. All rights reserved.
//

import UIKit
import C4

class ViewController: UIViewController {
    
    @IBAction func backButtonDidTouch(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var uesernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var centerAlignUsername: NSLayoutConstraint!
    @IBOutlet weak var centerAlignPassword: NSLayoutConstraint!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uesernameTextField.layer.cornerRadius = 5
        passwordTextField.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 5
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        centerAlignUsername.constant -= view.bounds.width
        centerAlignPassword.constant -= view.bounds.width
        loginButton.alpha = 0
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let a1 = ViewAnimation(duration: 0.5) {
            self.centerAlignUsername.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }
        a1.curve = .EaseOut
        a1.animate()
        let a2 = ViewAnimation(duration: 0.5) {
            self.centerAlignPassword.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }
        a2.delay = 0.10
        a2.curve = .EaseOut
        a2.animate()
        let a3 = ViewAnimation(duration: 0.5) {
            self.loginButton.alpha = 1
        }
        a3.delay = 0.20
        a3.curve = .EaseOut
        a3.animate()
        
    }
    
    @IBAction func loginButtonDidTouch(sender: UIButton) {
        
        let bounds = self.loginButton.bounds
        
        //Animate
        let animation = ViewAnimation(duration: 1.0) {
            self.loginButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            self.loginButton.enabled = false
        }
        animation.spring = Spring(damping: 0.2, initialVelocity: 10)
        animation.curve = .Linear
        animation.addCompletionObserver { 
            self.loginButton.enabled = true
        }
        animation.animate()

        
    }
    
}

