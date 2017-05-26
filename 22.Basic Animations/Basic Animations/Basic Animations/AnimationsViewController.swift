//
//  AnimationsViewController.swift
//  Basic Animations
//
//  Created by nimo on 2017/5/24.
//  Copyright © 2017年 nimoAndHisFriends. All rights reserved.
//

import UIKit

class PositionAnimationViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.view.backgroundColor = UIColor.white
        let rockManView = UIImageView(image: #imageLiteral(resourceName: "rockman"))
        rockManView.frame.size = CGSize(width: 200, height: 200)
        rockManView.center.y = self.view.center.y
        rockManView.frame.origin.x = 10
        self.view.addSubview(rockManView)
        
        let triggerButton = UIButton(type: .roundedRect)
        triggerButton.setTitle("Fire", for: .normal)
        triggerButton.layer.borderColor = UIColor.black.cgColor
        triggerButton.layer.borderWidth = 1
        triggerButton.addTarget(self, action: #selector(fire), for: .touchUpInside)
        triggerButton.frame.size = CGSize(width: 100, height: 50)
        triggerButton.center.x = self.view.center.x
        triggerButton.frame.origin.y = self.view.frame.height - 150
        self.view.addSubview(triggerButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func fire() {
        let bulletView = UIView()
        bulletView.backgroundColor = UIColor.green
        bulletView.frame.size = CGSize(width: 10, height: 10)
        bulletView.layer.cornerRadius = 5
        bulletView.layer.masksToBounds = true
        bulletView.center.y = self.view.center.y - 5
        bulletView.frame.origin.x = 200
        self.view.addSubview(bulletView)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: { 
            bulletView.frame.origin.x = self.view.frame.width + 10

        }) { (_) in
            bulletView.removeFromSuperview()
        }
    }
}

class OpacityAnimationViewController: UIViewController {
    
    var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        imgView = UIImageView(frame: self.view.frame)
        imgView.image = #imageLiteral(resourceName: "jobs")
        self.view.addSubview(imgView)
        imgView.alpha = 0

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1) {
            self.imgView.alpha = 1
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class ScaleAnimationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.isNavigationBarHidden = false
        let heartView = UIImageView(image: #imageLiteral(resourceName: "heart"))
        heartView.frame.size = CGSize(width: 223, height: 240)
        heartView.center = self.view.center
        self.view.addSubview(heartView)
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { (_) in
            UIView.animate(withDuration: 0.5, animations: {
                heartView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }, completion: { (_) in
                UIView.animate(withDuration: 0.5, animations: {
                    heartView.transform = CGAffineTransform.identity
                })
            })
        }
        timer.fire()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class ColorAnimationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.isNavigationBarHidden = false
        let nameLabel = UILabel()
        nameLabel.text = "NimoMeng"
        nameLabel.font = UIFont.systemFont(ofSize: 40)
        nameLabel.textColor = UIColor.black
        self.view.addSubview(nameLabel)
        nameLabel.sizeToFit()
        nameLabel.center = self.view.center

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1) { 
            self.view.backgroundColor = UIColor.brown
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class RotationAnimationViewController: UIViewController {
    
    var rollingBallView: UIImageView!
    var angle: CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.isNavigationBarHidden = false
        rollingBallView = UIImageView(image: #imageLiteral(resourceName: "rollingBall"))
        rollingBallView.frame.size = CGSize(width: 100, height: 100)
        rollingBallView.center = self.view.center
        self.view.addSubview(rollingBallView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { (_) in
            self.angle = self.angle + 0.04
            if self.angle > 6.28 {
                self.angle = 0
            }
            UIView.animate(withDuration: 0.02) {
                self.rollingBallView.transform = CGAffineTransform(rotationAngle: self.angle)
            }
        }
        timer.fire()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

