//
//  MenuTransitionManager.swift
//  Karate
//
//  Created by Oliver Andrews on 2016-05-11.
//  Copyright © 2016 Oliver Andrews. All rights reserved.
//

import UIKit
import C4

@objc protocol MenuTransitionManagerDelegate {
    
    func dismiss()
    
}

class MenuTransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    var duration = 0.5
    var isPresenting = false
    var snapshot:View? {
        
        didSet {
            if let _delegate = delegate {
                snapshot?.addTapGestureRecognizer({ (locations, center, state) in
                    _delegate.dismiss()
                })
            }
        }
    }
    
    var delegate:MenuTransitionManagerDelegate?
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        let container = transitionContext.containerView()
        
        let moveLeft = CGAffineTransformMakeTranslation(-141, 0)
        let moveRight = CGAffineTransformMakeTranslation(container!.frame.width-141, 0)
        let offscreenRight = CGAffineTransformMakeTranslation(container!.frame.width, 0)
        
        if isPresenting {
            toView.transform = offscreenRight
            snapshot = View(view: fromView.snapshotViewAfterScreenUpdates(true))
            container!.addSubview(toView)
            container!.addSubview(snapshot!.view)
        }
        let a = ViewAnimation(duration: duration) {
            if self.isPresenting {
                self.snapshot?.view.transform = moveLeft
                toView.transform = CGAffineTransformIdentity
            } else {
                self.snapshot?.view.transform = CGAffineTransformIdentity
                fromView.transform = moveRight
            }
        }
        a.spring = Spring(damping:0.9, initialVelocity: 0.3)
        a.addCompletionObserver {
            transitionContext.completeTransition(true)
            if !self.isPresenting {
                self.snapshot?.removeFromSuperview()
            }
        }
        a.animate()
    }
    
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresenting = false
        return self
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresenting = true
        return self
    }

}
