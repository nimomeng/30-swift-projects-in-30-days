//
//  ViewController.swift
//  BeautyContest
//
//  Created by nimo on 2017/5/21.
//  Copyright © 2017年 nimoAndHisFriends. All rights reserved.
//

import UIKit
import Koloda
import SnapKit

class ViewController: UIViewController {

    var kolodaView: KolodaView!
    var dataSource = Array<UIImage>()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 1...10 {
            dataSource.append(UIImage(named: "Photo\(index)")!)
        }
        
        self.view.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.5)
        kolodaView = KolodaView()
        self.view.addSubview(kolodaView)
        kolodaView.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.left.equalTo(20)
            make.right.equalTo(self.view.snp.right).offset(-20)
            make.bottom.equalTo(self.view.snp.bottom).offset(-100)
        }
        
        kolodaView.delegate = self
        kolodaView.dataSource = self

        let dislikeButton = UIButton(type: .custom)
        dislikeButton.setImage(#imageLiteral(resourceName: "ic_skip"), for: .normal)
        self.view.addSubview(dislikeButton)
        dislikeButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.snp.bottom).offset(-20)
            make.left.equalTo(self.view.snp.left).offset(90)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        dislikeButton.addTarget(self, action: #selector(dislikeAction), for: .touchUpInside)
        
        let likeButton = UIButton(type: .custom)
        likeButton.setImage(#imageLiteral(resourceName: "ic_like"), for: .normal)
        self.view.addSubview(likeButton)
        likeButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.snp.bottom).offset(-20)
            make.right.equalTo(self.view.snp.right).offset(-90)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        likeButton.addTarget(self, action: #selector(likeAction), for: .touchUpInside)
        
        self.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func likeAction() {
        kolodaView.swipe(.right)
    }
    
    func dislikeAction() {
        kolodaView.swipe(.left)
    }
    
    func loadData() {
        for index in 1...5 {
            dataSource.append(UIImage(named: "Photo\(index)")!)
        }
    }
}

// MARK:KolodaViewDelegate
extension ViewController:KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        
    }
}

// MARK:KolodaViewDataSource
extension ViewController:KolodaViewDataSource {
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return dataSource.count
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        return UIImageView(image: dataSource[index])
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        let overlayView = BeautyContestOverlayView(frame: self.kolodaView.frame)
        return overlayView
    }
    
}



