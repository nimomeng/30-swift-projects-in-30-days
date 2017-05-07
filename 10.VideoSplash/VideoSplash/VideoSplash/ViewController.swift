//
//  ViewController.swift
//  VideoSplash
//
//  Created by nimo on 2017/5/4.
//  Copyright © 2017年 nimoAndHisFriends. All rights reserved.
//

import UIKit

class ViewController: VideoSplashViewController {
    let buttonHeight:CGFloat = 56
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoBackground()
        
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 50, width: 334, height: 101))
        logoImageView.image = #imageLiteral(resourceName: "logo.png")
        self.view.addSubview(logoImageView)
        logoImageView.center.x = self.view.center.x
        
        let loginButton = UIButton(frame: CGRect(x: 0, y: (self.view.frame.size.height - buttonHeight), width: self.view.frame.width / 2.0, height: buttonHeight))
        loginButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        loginButton.setTitle("LOG IN", for: UIControlState.normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        loginButton.backgroundColor = UIColor(red: 35/255.0, green: 36/255.0, blue: 38/255.0, alpha: 1)
        self.view.addSubview(loginButton)
        
        let signupButton = UIButton(frame: CGRect(x: self.view.frame.width / 2.0, y: (self.view.frame.size.height - buttonHeight), width: self.view.frame.width / 2.0, height: buttonHeight))
        signupButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        signupButton.setTitle("SIGN UP", for: UIControlState.normal)
        signupButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        signupButton.backgroundColor = UIColor(red: 42/255.0, green: 183/255.0, blue: 90/255.0, alpha: 1)
        self.view.addSubview(signupButton)
    }
    
    func setupVideoBackground() {
        
        let url = NSURL.fileURL(withPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
        
        videoFrame = view.frame
        fillMode = .ResizeAspectFill
        alwaysRepeat = true
        sound = true
        startTime = 2.0
        alpha = 0.8
        
        contentURL = url as NSURL
        view.isUserInteractionEnabled = false
        
    }
}

