//
//  MenuViewController.swift
//  SideNavigation
//
//  Created by nimo on 2017/5/22.
//  Copyright © 2017年 nimoAndHisFriends. All rights reserved.
//

import UIKit

class MenuViewController: SWRevealViewController,UITableViewDelegate,UITableViewDataSource {

    var dataSource : Array<String>!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        dataSource = ["AnimatedCell","Slot Machine","Limited Input"]
        self.view.backgroundColor = UIColor.red
        let table = UITableView(frame: self.view.frame)
        table.delegate = self
        table.dataSource = self
        self.view.addSubview(table)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "reusableMenuViewControllerTableViewCell")
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var newViewController: UIViewController!
        switch indexPath.row {
        case 0:
            newViewController = ViewController()
        case 1:
            newViewController = SecondViewController()
        default:
            newViewController = ThirdViewController()
        }
        
        let navigationController = UINavigationController(rootViewController: newViewController)
        self.revealViewController().pushFrontViewController(navigationController, animated: true)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
