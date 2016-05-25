//
//  ViewController.swift
//  C4TextField
//
//  Created by Oliver Andrews on 2016-05-25.
//  Copyright © 2016 Oliver Andrews. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let akira = AkiraTextField()
        akira.placeholder = "Firstname"
        let akira2 = AkiraTextField()
        akira2.placeholder = "Lastname"

        
        akira.frame = CGRectMake(0, 45, 325, 45)
        akira2.frame = CGRectMake(0, 90, 325, 45)

        view.add(akira)
        view.add(akira2)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

