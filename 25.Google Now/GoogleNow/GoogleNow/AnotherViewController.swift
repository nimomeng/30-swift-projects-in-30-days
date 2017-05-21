//
//  AnotherViewController.swift
//  GoogleNow
//
//  Created by nimo on 2017/5/21.
//  Copyright © 2017年 nimoAndHisFriends. All rights reserved.
//

import UIKit

class AnotherViewController: UIViewController {

    var dismissButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.isNavigationBarHidden = true
        
        dismissButton = UIButton(type: .custom)
        dismissButton.frame.size = CGSize(width: 70, height: 70)
        dismissButton.center.x = self.view.center.x
        dismissButton.frame.origin.y = self.view.frame.height - 250
        dismissButton.backgroundColor = UIColor.red
        dismissButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
        dismissButton.layer.cornerRadius = dismissButton.frame.width / 2
        dismissButton.layer.masksToBounds = true
        dismissButton.layer.shadowColor = UIColor.black.cgColor
        dismissButton.setImage(#imageLiteral(resourceName: "loading"), for: .normal)
        self.view.addSubview(dismissButton)
        
        let leftBottomImgView = UIImageView()
        leftBottomImgView.frame.size = CGSize(width: 25, height: 25)
        leftBottomImgView.frame.origin = CGPoint(x: 22, y: self.view.frame.height - 25 - 22)
        leftBottomImgView.image = #imageLiteral(resourceName: "close")
        self.view.addSubview(leftBottomImgView)
        
        let rightBottomImgView = UIImageView()
        rightBottomImgView.frame.size = CGSize(width: 25, height: 25)
        rightBottomImgView.frame.origin = CGPoint(x: self.view.frame.width - 25 - 22, y: self.view.frame.height - 25 - 22)
        rightBottomImgView.image = #imageLiteral(resourceName: "earth")
        self.view.addSubview(rightBottomImgView)
        
        let resultLabel = UILabel()
        resultLabel.frame.origin = CGPoint(x: 35, y: 35)
        resultLabel.text = "Speak Now"
        resultLabel.font = UIFont.systemFont(ofSize: 28)
        resultLabel.textColor = UIColor(red: 150/255.0, green: 150/255.0, blue: 150/255.0, alpha: 1)
        self.view.addSubview(resultLabel)
        resultLabel.sizeToFit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func dismissAction() {
        self.dismiss(animated: true, completion: nil)
    }
}
