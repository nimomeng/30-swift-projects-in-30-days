//
//  ViewController.swift
//  snapChatLikeApp
//
//  Created by nimo on 25/03/2017.
//  Copyright © 2017 nimo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        self.view.addSubview(scrollView)
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentOffset = CGPoint(x: self.view.frame.width, y: 0)
        
        let leftViewController = LeftViewController()
        let centerViewController = CenterViewController()
        let rightViewController = RightViewController()
        
        self.addChildViewController(leftViewController)
        scrollView.addSubview(leftViewController.view)
//        leftViewController.didMove(toParentViewController: self)
        leftViewController.view.frame.origin.x = 0
        
        self.addChildViewController(centerViewController)
        scrollView.addSubview(centerViewController.view)
//        centerViewController.didMove(toParentViewController: self)
        centerViewController.view.frame.origin.x = self.view.frame.width
        
        self.addChildViewController(rightViewController)
        scrollView.addSubview(rightViewController.view)
//        rightViewController.didMove(toParentViewController: self)
        rightViewController.view.frame.origin.x = 2 * self.view.frame.width
        
        scrollView.contentSize = CGSize(width: 3 * self.view.frame.width, height: self.view.frame.height)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

