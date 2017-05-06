//
//  ViewController.swift
//  GradientInTableView
//
//  Created by nimo on 2017/5/6.
//  Copyright © 2017年 nimoAndHisFriends. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    private let cellHeight:CGFloat = 66
    private let colorRatio:CGFloat = 10
    private let lyric = "when i was young i'd listen to the radio,waiting for my favorite songs,when they played i'd sing along,it make me smile,those were such happy times and not so long ago,how i wondered where they'd gone,but they're back again just like a long lost friend,all the songs i love so well,every shalala every wo'wo,still shines,every shing-a-ling-a-ling"
    private var dataSource:Array<String>!
    override func viewDidLoad() {
        super.viewDidLoad()
        let table = UITableView(frame: self.view.frame)
        self.view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        
        self.dataSource = lyric.characters.split(separator: ",").map(String.init)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let uid = "reuseId"
        let cell = UITableViewCell(style: .default, reuseIdentifier: uid)
        cell.textLabel?.text = self.dataSource[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.cellHeight))
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bgView.frame
        let lowerColor:CGColor = UIColor(red: 1.0, green: (CGFloat(indexPath.row * 2) * self.colorRatio)/255.0, blue: (CGFloat(indexPath.row * 2) * self.colorRatio)/255.0, alpha: 1).cgColor
        let upperColor:CGColor = UIColor(red: 1.0, green: (CGFloat(indexPath.row * 2) * self.colorRatio + self.colorRatio)/255.0, blue: (CGFloat(indexPath.row * 2) * self.colorRatio + self.colorRatio)/255.0, alpha: 1).cgColor

        gradientLayer.colors = [lowerColor,upperColor]
        bgView.layer.addSublayer(gradientLayer)
        cell.addSubview(bgView)
        cell.sendSubview(toBack: bgView)
        cell.selectionStyle = .none
        
        return cell
    }
    
    


}

