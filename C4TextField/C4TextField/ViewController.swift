//
//  ViewController.swift
//  C4TextField
//
//  Created by Oliver Andrews on 2016-05-25.
//  Copyright © 2016 Oliver Andrews. All rights reserved.
//

import UIKit
import C4

class ViewController: CanvasController, UITableViewDelegate, UITableViewDataSource {

    var headers = ["Akira", "Madoka", "Hoshi", "Isao", "Jiro", "Kaede", "Minoru", "Yoko", "Yoshiko"]
    
    @IBOutlet weak var tableView: UITableView!
    override func setup() {
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return headers.count
    }
        
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //datasource method returning the what cell contains
        let cell = UITableViewCell()
        switch indexPath.section {
        case 0:
            let textField1 = AkiraTextField()
            let textField2 = AkiraTextField()
            
            textField1.placeholder = "Firstname"
            textField2.placeholder = "Lastname"
            switch indexPath.row {
            case 0:
                textField1.frame = cell.bounds
                cell.contentView.add(textField1)
            case 1:
                textField2.frame = cell.bounds
                cell.contentView.add(textField2)
            default:
                break
            }
        case 1:
            let textField1 = MadokaTextField()
            let textField2 = MadokaTextField()
            
            textField1.borderColor = UIColor.blueColor()
            textField2.borderColor = UIColor.blueColor()

            textField1.placeholder = "Firstname"
            textField2.placeholder = "Lastname"
            switch indexPath.row {
            case 0:
                textField1.frame = cell.bounds
                cell.contentView.add(textField1)
            case 1:
                textField2.frame = cell.bounds
                cell.contentView.add(textField2)
            default:
                break
            }
        case 2:
            let textField1 = HoshiTextField()
            let textField2 = HoshiTextField()
            textField1.placeholderColor = UIColor.blueColor()
            textField2.placeholderColor = UIColor.blueColor()
            textField1.borderActiveColor = UIColor.redColor()
            textField1.borderInactiveColor = UIColor.greenColor()
            textField2.borderActiveColor = UIColor.redColor()
            textField2.borderInactiveColor = UIColor.greenColor()
            textField1.placeholder = "Firstname"
            textField2.placeholder = "Lastname"
            switch indexPath.row {
            case 0:
                textField1.frame = cell.bounds
                cell.contentView.add(textField1)
            case 1:
                textField2.frame = cell.bounds
                cell.contentView.add(textField2)
            default:
                break
            }
        case 3:
            let textField1 = IsaoTextField()
            let textField2 = IsaoTextField()
            textField1.activeColor = UIColor.greenColor()
            textField2.activeColor = UIColor.greenColor()
            textField1.inactiveColor = UIColor.redColor()
            textField2.inactiveColor = UIColor.redColor()
            textField1.placeholder = "Firstname"
            textField2.placeholder = "Lastname"
            switch indexPath.row {
            case 0:
                textField1.frame = cell.bounds
                cell.contentView.add(textField1)
            case 1:
                textField2.frame = cell.bounds
                cell.contentView.add(textField2)
            default:
                break
            }
        case 4:
            let textField1 = JiroTextField()
            let textField2 = JiroTextField()
            textField1.borderColor = UIColor.greenColor()
            textField2.borderColor = UIColor.greenColor()
            textField1.placeholder = "Firstname"
            textField2.placeholder = "Lastname"
            switch indexPath.row {
            case 0:
                textField1.frame = cell.bounds
                cell.contentView.add(textField1)
            case 1:
                textField2.frame = cell.bounds
                cell.contentView.add(textField2)
            default:
                break
            }
        case 5:
            let textField1 = KaedeTextField()
            let textField2 = KaedeTextField()
            textField1.foregroundColor = UIColor.blueColor()
            textField2.foregroundColor = UIColor.blueColor()
            textField1.placeholderColor = UIColor.whiteColor()
            textField2.placeholderColor = UIColor.whiteColor()
            textField1.placeholder = "Firstname"
            textField2.placeholder = "Lastname"
            switch indexPath.row {
            case 0:
                textField1.frame = cell.bounds
                cell.contentView.add(textField1)
            case 1:
                textField2.frame = cell.bounds
                cell.contentView.add(textField2)
            default:
                break
            }
        case 6:
            let textField1 = MinoruTextField()
            let textField2 = MinoruTextField()
            textField1.backgroundColor = UIColor.blueColor()
            textField2.backgroundColor = UIColor.blueColor()
            textField1.placeholderColor = UIColor.redColor()
            textField2.placeholderColor = UIColor.redColor()
            textField1.placeholder = "Firstname"
            textField2.placeholder = "Lastname"
            switch indexPath.row {
            case 0:
                textField1.frame = cell.bounds
                cell.contentView.add(textField1)
            case 1:
                textField2.frame = cell.bounds
                cell.contentView.add(textField2)
            default:
                break
            }
        case 7:
            let textField1 = YokoTextField()
            let textField2 = YokoTextField()
            
            textField1.placeholder = "Firstname"
            textField2.placeholder = "Lastname"
            switch indexPath.row {
            case 0:
                textField1.frame = cell.bounds
                cell.contentView.add(textField1)
            case 1:
                textField2.frame = cell.bounds
                cell.contentView.add(textField2)
            default:
                break
            }
        case 8:
            let textField1 = YoshikoTextField()
            let textField2 = YoshikoTextField()
            
            textField1.placeholder = "Firstname"
            textField2.placeholder = "Lastname"
            switch indexPath.row {
            case 0:
                textField1.frame = cell.bounds
                cell.contentView.add(textField1)
            case 1:
                textField2.frame = cell.bounds
                cell.contentView.add(textField2)
            default:
                break
            }
        default:
            break
        
        }
        return cell
    }
    
//    func addTextField(textField: TextFieldEffects, toIndexPath indexPath: NSIndexPath, forCell cell: UITableViewCell) {
//        let textField1 = textField
//        let textField2 = textField
//        textField1.placeholder = "Firstname"
//        textField2.placeholder = "Lastname"
//        switch indexPath.row {
//        case 0:
//            textField1.frame = cell.bounds
//            cell.contentView.add(textField1)
//        case 1:
//            textField2.frame = cell.bounds
//            cell.contentView.add(textField2)
//        default:
//            break
//        }
//    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return headers[section]
    }
    

}

