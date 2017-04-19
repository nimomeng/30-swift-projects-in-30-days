//
//  ViewController.swift
//  PullToRefresh
//
//  Created by nimo on 19/04/2017.
//  Copyright © 2017 nimo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var dataSource = Array<Date>()
    let refresh = UIRefreshControl()
    var table : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        table = UITableView(frame: self.view.bounds)
        table.frame.origin.y = 44
        self.view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        addNewElementToArray()
        refresh.attributedTitle = NSAttributedString(string: "拉什么拉！？再拉朕就要碎了")
        refresh.addTarget(self, action: #selector(pullTheRefresh), for: UIControlEvents.valueChanged)
        table.addSubview(refresh)
        table.reloadData()

    }
    
    func pullTheRefresh() {
        addNewElementToArray()
        refresh.endRefreshing()
        table.reloadData()
    }

    func addNewElementToArray() {
        dataSource.insert(NSDate() as Date, at: 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "reuseCellForPullToRefresh")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日/HH时mm分ss秒"
        let dateStr = dateFormatter.string(from: dataSource[indexPath.row])
        cell.textLabel?.text = dateStr
        return cell
    }


}

