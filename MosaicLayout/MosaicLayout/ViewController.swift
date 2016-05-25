//
//  ViewController.swift
//  MosaicLayout
//
//  Created by Oliver Andrews on 2016-05-23.
//  Copyright © 2016 Oliver Andrews. All rights reserved.
//

import UIKit
import FMMosaicLayout
import C4

class ViewController: UICollectionViewController, FMMosaicLayoutDelegate {
    
    var imageArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21"]
        
        let mosaicLayout : FMMosaicLayout = FMMosaicLayout()
        self.collectionView?.collectionViewLayout = mosaicLayout
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, numberOfColumnsInSection section: Int) -> Int {
        return 1
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 10
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
        
        let randomBlue = CGFloat(random01())
        let randomRed = CGFloat(random01())
        let randomGreen = CGFloat(random01())
        
        cell.backgroundColor = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        cell.alpha = 0
        
        let imageView = cell.viewWithTag(2) as! UIImageView
        imageView.image = UIImage(named: imageArray[indexPath.row])
        
        
        let cellDelay = Double((random(below: 600) / 1000 ))
        
        
        wait(cellDelay) {
            ViewAnimation(duration: 0.8) {
                cell.alpha = 1.0
            }.animate()
        }
        
        return cell
        
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
    }
    
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, interitemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: FMMosaicLayout!, mosaicCellSizeForItemAtIndexPath indexPath: NSIndexPath! ) -> FMMosaicCellSize {
        return indexPath.item % 7 == 0 ? FMMosaicCellSize.Big : FMMosaicCellSize.Small
    }
    
    
    
    
}

