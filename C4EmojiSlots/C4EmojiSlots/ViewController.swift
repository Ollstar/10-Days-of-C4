//
//  ViewController.swift
//  C4EmojiSlots
//
//  Created by Oliver Andrews on 2016-05-16.
//  Copyright © 2016 Oliver Andrews. All rights reserved.
//

import UIKit
import C4

class ViewController: CanvasController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var emojiPickerView: UIPickerView!
    @IBOutlet weak var goButton: UIButton!
    @IBAction func goButtoDidTouch(sender: AnyObject) {
        random(below: 101)
        emojiPickerView.selectRow(random(below: 100), inComponent: 0, animated: true)
        emojiPickerView.selectRow(random(below: 100), inComponent: 1, animated: true)
        emojiPickerView.selectRow(random(below: 100), inComponent: 2, animated: true)
        
        
        if(dataArray1[emojiPickerView.selectedRowInComponent(0)] == dataArray2[emojiPickerView.selectedRowInComponent(1)] && dataArray2[emojiPickerView.selectedRowInComponent(1)] == dataArray3[emojiPickerView.selectedRowInComponent(2)]) {
            
            resultLabel.text = "Bingo!"
            
        } else {
            
            resultLabel.text = "💔"
            
        }
        
        
        //animate
        let animation1 = ViewAnimation(duration: 0.5) {
                        self.goButton.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width + 20, height: self.bounds.size.height)
        }
        
        animation1.spring = Spring(damping:0.1, initialVelocity: 5)
        animation1.curve = .Linear
        
        let animation2 = ViewAnimation(duration: 0.1) {
                                self.goButton.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width, height: self.bounds.size.height)
        }
        animation2.curve = .EaseInOut
        let aniGroup = ViewAnimationGroup(animations:[animation1, animation2])
        aniGroup.animate()
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var imageArray = [String]()
    var dataArray1 = [Int]()
    var dataArray2 = [Int]()
    var dataArray3 = [Int]()
    var bounds: CGRect = CGRectZero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bounds = goButton.bounds
        imageArray = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
        
        for _ in 0 ..< 100 {
            dataArray1.append(random(below: 10))
            dataArray2.append(random(below: 10))
            dataArray3.append(random(below: 10))
        }
        

        emojiPickerView.delegate = self
        emojiPickerView.dataSource = self
        
        goButton.layer.cornerRadius = 6
        
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        goButton.alpha = 0
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        ViewAnimation(duration: 0.5) {
            self.goButton.alpha = 1

        }.animate()
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        
        switch component {
        case 0:
            pickerLabel.text = imageArray[(Int)(dataArray1[row])]
        case 1:
            pickerLabel.text = imageArray[(Int)(dataArray2[row])]
        default:
            pickerLabel.text = imageArray[(Int)(dataArray3[row])]

        }
        
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
        pickerLabel.textAlignment = NSTextAlignment.Center
        
        return pickerLabel
        
    }
    
    
    
}

