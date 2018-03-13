//
//  ViewController.swift
//  CustomTransition
//
//  Created by nimo on 2017/5/15.
//  Copyright © 2017年 nimoAndHisFriends. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UINavigationControllerDelegate {
    var collectionView : UICollectionView!
    var dataSource : Array<CustomCollectionViewCellModel>!
    var selectedCell: CustomCollectionViewCell!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        self.view.addSubview(collectionView)
        
        //        fake data input
        dataSource = Array<CustomCollectionViewCellModel>()
        for _ in 0..<10 {
            let model = CustomCollectionViewCellModel()
            model.image = #imageLiteral(resourceName: "Image")
            dataSource.append(model)
        }
}
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.delegate = self
        self.navigationController?.isNavigationBarHidden = true
        collectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 140)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        cell.configCell(model: dataSource[indexPath.row])
        return  cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 20, 10, 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedCell = collectionView.cellForItem(at: indexPath) as! CustomCollectionViewCell
        let detailVC = DetailViewController()
        detailVC.img = self.selectedCell.imageView.image
        self.navigationController?.pushViewController(detailVC, animated: true)
    }

    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.push {
            return CustomPushTransition()
        } else {
            return nil
        }
    }
}

