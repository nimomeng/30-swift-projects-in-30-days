//
//  DetailViewController.swift
//  SpotlightSearch
//
//  Created by nimo on 2017/5/16.
//  Copyright © 2017年 nimoAndHisFriends. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    init(with model:Dictionary<String,Any>) {
        super.init(nibName: nil, bundle: nil)
        let cover = model["cover"] as? UIImage
        let description = model["description"] as? String
        let name = model["name"] as? String
        let ranking = model["rank"] as? Int
        
        let coverImageView = UIImageView(frame: CGRect(x: 10, y: 80, width: 100, height: 140))
        self.view.addSubview(coverImageView)
        coverImageView.center.x = self.view.center.x
        coverImageView.image = cover
        
        let nameLabel = UILabel(frame: CGRect(x: 10, y: coverImageView.frame.height + 60 + 10, width: 300, height: 50))
        nameLabel.text = name
        nameLabel.textAlignment = .center
        nameLabel.center.x = self.view.center.x
        self.view.addSubview(nameLabel)
        
        let textViewY = coverImageView.frame.height + 50 + 50 + 10
        let textView = UITextView(frame: CGRect(x: 0, y: textViewY, width: self.view.frame.width, height: self.view.frame.height - textViewY - 10))
        self.view.addSubview(textView)
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.text = description
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isToolbarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
