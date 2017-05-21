//
//  ViewController.swift
//  GoogleNow
//
//  Created by nimo on 2017/5/21.
//  Copyright © 2017年 nimoAndHisFriends. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIViewControllerTransitioningDelegate {

    let transition = BubbleTransition()
    var triggerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1)
        self.navigationController?.isNavigationBarHidden = true
        
        let leftImgView = UIImageView(frame: CGRect(x: 22, y: 22, width: 25, height: 25))
        leftImgView.image = #imageLiteral(resourceName: "setting")
        self.view.addSubview(leftImgView)
        
        let rightImgView = UIImageView(frame: CGRect(x: (self.view.frame.width - 22 - 25), y: 22, width: 25, height: 25))
        rightImgView.image = #imageLiteral(resourceName: "window")
        self.view.addSubview(rightImgView)
        
        let signInLabel = UILabel()
        signInLabel.text = "SIGN IN"
        signInLabel.frame.origin.y = 22
        signInLabel.textColor = UIColor(red: 150/255.0, green: 150/255.0, blue: 150/255.0, alpha: 1)
        signInLabel.font = UIFont.systemFont(ofSize: 20)
        signInLabel.sizeToFit()
        self.view.addSubview(signInLabel)
        signInLabel.center.x = self.view.center.x
        
        
        let logoImgView = UIImageView()
        logoImgView.frame.size = CGSize(width: 170, height: 71)
        logoImgView.image = #imageLiteral(resourceName: "google_logo")
        logoImgView.center.x = self.view.center.x
        logoImgView.center.y = self.view.center.y - 50 - 71
        self.view.addSubview(logoImgView)
        
        let inputView = UITextField()
        inputView.frame.size = CGSize(width: self.view.frame.width - 60, height: 50)
        inputView.center.x = self.view.center.x
        inputView.center.y = self.view.center.y - 20
        inputView.borderStyle = .none
        inputView.layer.borderColor = UIColor(red: 238/255.0, green: 238/255.0, blue: 238/255.0, alpha: 1).cgColor
        inputView.backgroundColor = UIColor.white
        inputView.layer.borderWidth = 1.0
        self.view.addSubview(inputView)
        
        triggerButton = UIButton(type: .custom)
        triggerButton.frame.size = CGSize(width: 70, height: 70)
        triggerButton.center.x = self.view.center.x
        triggerButton.frame.origin.y = inputView.frame.maxY + 40
        triggerButton.backgroundColor = UIColor.white
        triggerButton.addTarget(self, action: #selector(triggerAction), for: .touchUpInside)
        triggerButton.layer.cornerRadius = triggerButton.frame.width / 2
        triggerButton.layer.masksToBounds = true
        triggerButton.layer.shadowColor = UIColor.black.cgColor
        triggerButton.setImage(#imageLiteral(resourceName: "speaking"), for: .normal)
        self.view.addSubview(triggerButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func triggerAction() {
        let anotherVC = AnotherViewController()
        anotherVC.transitioningDelegate = self
        anotherVC.modalPresentationStyle = .custom
        self.navigationController?.present(anotherVC, animated: true, completion: nil)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = triggerButton.center
        transition.bubbleColor = triggerButton.backgroundColor!
        transition.animationBlock = {(transitionMode) -> Void in
            if transitionMode == .dismiss {
                let dismissedVC = dismissed as! AnotherViewController
                dismissedVC.dismissButton.frame.origin.y = self.view.frame.height - 250
            }
        }
        transition.duration = 0.4
        return transition
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = triggerButton.center
        transition.bubbleColor = UIColor.white
        transition.animationBlock = {(transitionMode) -> Void in
            if transitionMode == .present {
                let targetVC = presented as! AnotherViewController
                targetVC.dismissButton.frame.origin.y = self.view.frame.height - 150
            }
        }
        transition.duration = 0.4
        return transition
    }


}

