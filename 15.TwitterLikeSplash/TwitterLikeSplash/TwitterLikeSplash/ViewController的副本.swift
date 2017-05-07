//
//  ViewController.swift
//  TwitterLikeSplash
//
//  Created by nimo on 2017/5/7.
//  Copyright © 2017年 nimoAndHisFriends. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let bgImageView = UIImageView(image: #imageLiteral(resourceName: "twitterBG.jpeg"))
        bgImageView.frame = self.view.frame
        self.view.addSubview(bgImageView)
        
        let logoLayer = CALayer()
        logoLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        logoLayer.position = view.center
        logoLayer.contents = #imageLiteral(resourceName: "logo.png").cgImage
        view.layer.mask = logoLayer
        
        let shelterView = UIView(frame: view.frame)
        shelterView.backgroundColor = .white
        view.addSubview(shelterView)
        
        let appDelegate = UIApplication.shared.delegate
        let window = appDelegate?.window!
        window?.backgroundColor = UIColor(red: 29 / 255.0, green: 161 / 255.0, blue: 242 / 255.0, alpha: 1)
        
        let logoAnimation = CAKeyframeAnimation(keyPath: "bounds")
        logoAnimation.beginTime = CACurrentMediaTime() + 1
        logoAnimation.duration = 1
        logoAnimation.keyTimes = [0, 0.4, 1]
        logoAnimation.values = [NSValue(cgRect: CGRect(x: 0, y: 0, width: 100, height: 100)),
                                NSValue(cgRect: CGRect(x: 0, y: 0, width: 85, height: 85)),
                                NSValue(cgRect: CGRect(x: 0, y: 0, width: 4500, height: 4500))]
        logoAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut),
                                         CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)]
        logoAnimation.isRemovedOnCompletion = false
        logoAnimation.fillMode = kCAFillModeForwards
        logoLayer.add(logoAnimation, forKey: "zoomAnimation")
        
        UIView.animate(withDuration: 0.3, delay: 1.4, options: .curveLinear, animations: {
            shelterView.alpha = 0
        }) { (_) in
            shelterView.removeFromSuperview()
            self.view.layer.mask = nil
        }
    }

    override var prefersStatusBarHidden:Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

