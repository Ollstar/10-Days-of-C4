//
//  AppDelegate.swift
//  AnimatedSplash
//
//  Created by Oliver Andrews on 2016-05-16.
//  Copyright © 2016 Oliver Andrews. All rights reserved.
//

import UIKit
import C4

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var mask: Layer?
    var img: Image!
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.rootViewController = UIViewController()
        
        img = Image("screen")
        
        img!.frame = Rect(self.window!.frame)
        self.window!.addSubview((img?.view)!)
        
        
        self.mask = Layer()
        self.mask!.contents = Image("twitter")!.cgimage
        self.mask!.contentsGravity = kCAGravityResizeAspect
        self.mask!.bounds = CGRect(x: 0, y: 0, width: 100, height: 81)
        self.mask!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.mask!.position = CGPoint(img!.bounds.center)
        img!.layer!.mask = mask
        
        animateMask()
        
        self.window!.backgroundColor = UIColor(red:0.117, green:0.631, blue:0.949, alpha:1)
        self.window!.makeKeyAndVisible()
        UIApplication.sharedApplication().statusBarHidden = true
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func animateMask() {
        
        let a1 = ViewAnimation(duration:0.2) {
            self.mask!.bounds = CGRect(x: 0,y: 0,width: 100,height: 81)
        }
        let a2 = ViewAnimation(duration:0.4) {
            self.mask!.bounds = CGRect(x: 0,y: 0,width: 1600,height: 1300)
        }
        let seq = ViewAnimationSequence(animations:[a1,a2])
        seq.animate()
        
        seq.addCompletionObserver { 
            self.img!.layer!.mask = nil

        }
    }
}

