//
//  ViewController.swift
//  C4TextField
//
//  Created by Oliver Andrews on 2016-05-25.
//  Copyright © 2016 Oliver Andrews. All rights reserved.
//

import UIKit
import C4

class ViewController: CanvasController {

    override func setup() {
        canvas.backgroundColor = white
        let akira = HoshiTextField()
        akira.placeholder = "Firstname"
//        akira.borderColor = UIColor.blueColor()
        let akira2 = AkiraTextField()
        akira2.placeholder = "Lastname"
        
        
        akira.frame = CGRectMake(0, 45, 325, 45)
        akira2.frame = CGRectMake(0, 90, 325, 45)
        
        view.add(akira)
        view.add(akira2)
    }

}

