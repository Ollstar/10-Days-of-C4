//
//  ViewController.swift
//  VideoBackground
//
//  Created by Oliver Andrews on 2016-05-25.
//  Copyright © 2016 Oliver Andrews. All rights reserved.
//

import UIKit
import C4

class ViewController: CanvasController {
    
    var moviePlayer = Movie("Jackie Chan funniest movie clip.mov")!
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    override func setup() {
        moviePlayer.muted = true
        
        loginButton.layer.cornerRadius = 4
        signupButton.layer.cornerRadius = 4
    }
    
    override func viewDidAppear(animated: Bool) {
        moviePlayer.frame = canvas.frame
        canvas.add(moviePlayer)
        canvas.sendToBack(moviePlayer)
        moviePlayer.play()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
            moviePlayer.stop()
    }
    
}


