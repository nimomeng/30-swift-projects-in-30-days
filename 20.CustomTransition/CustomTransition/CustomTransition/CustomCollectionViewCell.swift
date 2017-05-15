//
//  CustomCollectionViewCell.swift
//  Carousel Effect
//
//  Created by nimo on 09/04/2017.
//  Copyright © 2017 nimo. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    var imageView:UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public func configCell(model:CustomCollectionViewCellModel) {
        imageView = UIImageView(frame: self.bounds)
        imageView.image = model.image
        self.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
