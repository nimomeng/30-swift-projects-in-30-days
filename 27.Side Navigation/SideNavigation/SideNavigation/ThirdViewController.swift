//
//  ThirdViewController.swift
//  SideNavigation
//
//  Created by nimo on 2017/5/22.
//  Copyright © 2017年 nimoAndHisFriends. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(image: UIImage(named: "ThirdViewController"))
        imageView.frame = self.view.frame
        self.view.addSubview(imageView)
        self.navigationController?.isNavigationBarHidden = true
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
