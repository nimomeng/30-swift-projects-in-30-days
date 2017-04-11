//
//  CustomCollectionViewLayout.swift
//  Carousel Effect
//
//  Created by nimo on 09/04/2017.
//  Copyright © 2017 nimo. All rights reserved.
//

import UIKit

class CustomCollectionViewLayout: UICollectionViewFlowLayout {
    var itemWH:CGFloat!
    var inset:CGFloat!
    
//    准备函数
    override func prepare() {
        super.prepare()

        let collectionW = self.collectionView?.frame.size.width ;
        self.itemSize = CGSize(width: collectionW! * 0.5, height: collectionW! * 0.6)
        let leftRight = (collectionW! - self.itemSize.width) * 0.5;
        self.sectionInset = UIEdgeInsetsMake(0, leftRight, 0, leftRight);
    }
    
//    是否实时更改bounds，更改各个cell的frame等
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
//    如果需要滚动过程中停在特定的cell上，请在此给出规则
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {

        var lastRect = CGRect()
        lastRect.size = (self.collectionView?.frame.size)!
        lastRect.origin = proposedContentOffset;
        
        let centerX = proposedContentOffset.x + (self.collectionView?.frame.size.width)! * 0.5
        var adjustX = MAXFLOAT
        let array = self.layoutAttributesForElements(in: lastRect)
        for attr in array! {
            if (abs(Float(attr.center.x - centerX)) < abs(adjustX)) {
                adjustX = Float(attr.center.x - centerX)
            }
        }
        return CGPoint(x: proposedContentOffset.x + CGFloat(adjustX), y: proposedContentOffset.y)
    }
    
//    设置在滚动中各个cell的变化公式
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
  
        let newArr = super.layoutAttributesForElements(in: rect)
        let collectionViewCenterX = (self.collectionView?.frame.size.width)! * 0.5 + (self.collectionView?.contentOffset.x)!
        
        for attributes in newArr! {
            let scale = 1 - abs(attributes.center.x - collectionViewCenterX) / (self.collectionView?.frame.size.width)! * 0.5;
            attributes.transform = CGAffineTransform(scaleX: scale, y: scale);
        }
        return newArr

    }
}
