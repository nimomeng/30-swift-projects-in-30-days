//
//  CustomTransition.swift
//  CustomTransition
//
//  Created by nimo on 2017/5/15.
//  Copyright © 2017年 nimoAndHisFriends. All rights reserved.
//

import UIKit

@objc protocol CustomTransitionDelegate {
    func dismiss()
}

class CustomTransition: NSObject,UIViewControllerAnimatedTransitioning {
    public var delegate: CustomTransitionDelegate!
    public var navigationType: ViewControllerNavigationType!
    private var snapShot: UIView!

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: .from)
        let toViewController = transitionContext.viewController(forKey: .to)
        let containerView = transitionContext.containerView
        
        let fromView = fromViewController?.view
        let toView = toViewController?.view
        
        if navigationType == .Present {
            fromView?.transform = CGAffineTransform(translationX: 0, y: 0)
            toView?.transform = CGAffineTransform(translationX: 0, y: -50)
            snapShot = (fromView?.snapshotView(afterScreenUpdates: true))!
            containerView.addSubview(toView!)
            containerView.addSubview(snapShot)
            
            let tapGesture = UITapGestureRecognizer(target: delegate, action: #selector(CustomTransitionDelegate.dismiss))
            snapShot.addGestureRecognizer(tapGesture)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.snapShot.transform = CGAffineTransform(translationX: 0, y: containerView.frame.height - 150)
                toView?.transform = CGAffineTransform.identity
            }) { (_) in
                transitionContext.completeTransition(true)
                fromViewController?.endAppearanceTransition()
                toViewController?.endAppearanceTransition()
            }
        }
        else {
            UIView.animate(withDuration: 0.5, animations: {
                self.snapShot.transform = CGAffineTransform.identity
                fromView?.transform = CGAffineTransform.identity

            }, completion: { (_) in
                self.snapShot.removeFromSuperview()
                transitionContext.completeTransition(true)
                fromViewController?.endAppearanceTransition()
                toViewController?.endAppearanceTransition()
            })
        }
       
    }
}
