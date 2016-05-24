//
//  SplashViewController.swift
//  LoginAnimation
//
//  Created by Oliver Andrews on 2016-05-21.
//  Copyright © 2016 Oliver Andrews. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signupButton.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 5
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
}
