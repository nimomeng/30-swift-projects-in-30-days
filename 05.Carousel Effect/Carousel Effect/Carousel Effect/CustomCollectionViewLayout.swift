//
//  CustomCollectionViewLayout.swift
//  Carousel Effect
//
//  Created by nimo on 09/04/2017.
//  Copyright © 2017 nimo. All rights reserved.
//

import UIKit

class CustomCollectionViewLayout: UICollectionViewLayout {

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        var targetP = super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        
        let collectionW = self.collectionView?.bounds.size.width
        
        let targetRect = CGRect(x: targetP.x, y: 0, width: collectionW!, height: 10000)
        
        let attrs = super.layoutAttributesForElements(in: targetRect)
        
        var minDelta : CGFloat = CGFloat(MAXFLOAT)
        for attr in attrs! {
            let delta : CGFloat = attr.center.x - targetP.x - (self.collectionView?.bounds.size.width)! * 0.5
            
            if (fabs(delta) < fabs(minDelta)) {
                minDelta = delta;
            }
        }
        
        targetP.x += minDelta
        
        if (targetP.x < 0) {
            targetP.x = 0
        }
        
        return targetP
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
         // 设置cell尺寸 => UICollectionViewLayoutAttributes
         // 越靠近中心点,距离越小,缩放越大
         // 求cell与中心点距离
        
        let attrs = super.layoutAttributesForElements(in: (self.collectionView?.bounds)!)
        
        for attr in attrs! {
            let delta = fabs((attr.center.x - (self.collectionView?.contentOffset.x)!) - (self.collectionView?.bounds.size.width)! * 0.5)
            let scale = 1 - delta / ((self.collectionView?.bounds.size.width)! * 0.5) * 0.25
            attr.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
            return attrs
    }
}

