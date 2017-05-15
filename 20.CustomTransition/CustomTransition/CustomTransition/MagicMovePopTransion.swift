//
//  MagicMovePopTransion.swift
//  MagicMove
//
//  Created by BourneWeng on 15/7/13.
//  Copyright (c) 2015年 Bourne. All rights reserved.
//

import UIKit

class MagicMovePopTransion: NSObject, UIViewControllerAnimatedTransitioning {
   
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! DetailViewController
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! ViewController
        let container = transitionContext.containerView
        
        let snapshotView = fromVC.avatarImageView.snapshotView(afterScreenUpdates: false)
        snapshotView?.frame = container.convert(fromVC.avatarImageView.frame, from: fromVC.view)
        fromVC.avatarImageView.isHidden = true
        
        toVC.view.frame = transitionContext.finalFrame(for: toVC)
        toVC.selectedCell.imageView.isHidden = true
        
        container.insertSubview(toVC.view, belowSubview: fromVC.view)
        container.addSubview(snapshotView!)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: UIViewAnimationOptions(), animations: { () -> Void in
            snapshotView?.frame = container.convert(toVC.selectedCell.imageView.frame, from: toVC.selectedCell)
            fromVC.view.alpha = 0
            }) { (finish: Bool) -> Void in
                toVC.selectedCell.imageView.isHidden = false
                snapshotView?.removeFromSuperview()
                fromVC.avatarImageView.isHidden = false
                
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
