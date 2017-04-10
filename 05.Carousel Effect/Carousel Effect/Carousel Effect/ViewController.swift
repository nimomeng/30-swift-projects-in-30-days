//
//  ViewController.swift
//  Carousel Effect
//
//  Created by nimo on 09/04/2017.
//  Copyright © 2017 nimo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    var collectionView : UICollectionView!
    var dataSource : Array<CustomCollectionViewCellModel>!
    override func viewDidLoad() {
        super.viewDidLoad()
        let bgView = UIView(frame: self.view.bounds)
        
        let bgImageView = UIImageView(frame: self.view.bounds)
        bgImageView.image = #imageLiteral(resourceName: "bg")
        bgView.addSubview(bgImageView)
        
        let blurEffect: UIBlurEffect = UIBlurEffect(style: .light)
        let blurView: UIVisualEffectView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.bounds//CGRectMake(50.0, 50.0, self.view.frame.width - 100.0, 200.0)
        bgView.addSubview(blurView)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.backgroundView = bgView
        collectionView.delegate = self
        
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        self.view.addSubview(collectionView)
        
//        fake data input
        let model1 = CustomCollectionViewCellModel()
        model1.comment = "1111"
        model1.image = #imageLiteral(resourceName: "Photo1")
        
        let model2 = CustomCollectionViewCellModel()
        model2.comment = "222"
        model2.image = #imageLiteral(resourceName: "Photo2")
        
        let model3 = CustomCollectionViewCellModel()
        model3.comment = "333"
        model3.image = #imageLiteral(resourceName: "Photo3")
        
        let model4 = CustomCollectionViewCellModel()
        model4.comment = "444"
        model4.image = #imageLiteral(resourceName: "Photo4")
        
        let model5 = CustomCollectionViewCellModel()
        model5.comment = "555"
        model5.image = #imageLiteral(resourceName: "Photo5")
        
        dataSource = Array(arrayLiteral: model1,model2,model3,model4,model5)
//        var dataArray = Array<Any>()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 330, height: 540)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        cell.configCell(model: dataSource[indexPath.row])
        return cell
    }
//    todo 实现自定义flowlayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 20, 10, 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

