//
//  ViewController.swift
//  SpotlightSearch
//
//  Created by nimo on 2017/5/16.
//  Copyright © 2017年 nimoAndHisFriends. All rights reserved.
//

import UIKit
import CoreSpotlight

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    public let notificationName = NSNotification.Name.init("receivedIdFromSpotlightSearch")

    let table = UITableView(frame: UIScreen.main.bounds)
    let dataSource = [
        ["name":"Dangal","cover":#imageLiteral(resourceName: "Dangal"),"description":"This is a warm and humorous inspirational story. Maha Via Singh Pe (Amirkhan) was a India national wrestling champion, forced to give up wrestling because of life. He wants his son to help him achieve his dream - to win a world class gold medal. The results gave birth to four daughters thought this dream shattered Singer unexpectedly found her amazing talent on the body, see the champions hope he was determined not to let the talent waste daughter, like other girls can only cook over a lifetime, after consideration, agreed with his wife a year two daughters training according to the wrestler standard: replace the skirt, cut my hair, let them practice wrestling, and won a championship final to win the women the opportunity to become a model inspired thousands on thousands of.","ranking":8.6],
        ["name":"Guardians of the Galaxy","cover":#imageLiteral(resourceName: "Guardians of the Galaxy"),"description":"The Galactic guards cross the universe in this focus, continuing epic adventures in outer space. They must fight together, protect each other, and unravel the mystery of the star Peter Quill. The old enemy became allies, and the favorite characters in the comics would show up and help the guards.Along with the 'second series of songs' the background music, the Milky Way convoy to the more distant cosmic star domain, while efforts to maintain this new family while not easily won, trying to uncover the mystery of the truth Peter Quel descent. In this journey, the enemies of the past will become allies of today, and the classic comic characters who are loved by fans will come to help our hero.","ranking":7.9],
        ["name":"Absurd Accident","cover":#imageLiteral(resourceName: "Absurd Accident"),"description":"Northeast, Yang million and his wife Ma Lilian runs 'Cyclamen hotel'. Yang Baiwan was not for middle-aged patients, but Ma Lilian is a sexy, bold tiger Yang Baiwan, low self-esteem, worried all day. Finally one day, Yang million that Ma Lilian was a cuckold for himself, angrily found a doctor after work, two people planning a revenge on Ma Lilian's plan... That night, the killer rujierzhi, two robbers and a couple of temporary but came to the hotel and a strange combination of circumstances, both involved in the event. The few unrelated people originally interacted with each other, making the already confusing situation even more surprising. Everyone has experienced a fearful experience in order to achieve his goal, and then a series of absurd and funny things happen. At the same time, their fortunes changed...","ranking":7.0]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        self.view.addSubview(table)
        
        CSSearchableIndex.default().deleteAllSearchableItems { (error) in
            print("delete all")
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(receivedNotification(sender:)), name: notificationName, object: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isToolbarHidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "reusableCell")
        let itemDic = dataSource[indexPath.row]
        cell.imageView?.image = itemDic["cover"] as? UIImage
        cell.textLabel?.text = itemDic["name"] as? String
        cell.detailTextLabel?.text = itemDic["description"] as? String
        
        let attributSet = CSSearchableItemAttributeSet(itemContentType: "test")
        attributSet.title = itemDic["name"] as? String
        attributSet.contentDescription = itemDic["description"] as? String
        let imageData = UIImageJPEGRepresentation((itemDic["cover"] as? UIImage)!, 0.7)
        attributSet.thumbnailData = imageData
        
        let searchItem = CSSearchableItem(uniqueIdentifier: "\(indexPath.row)", domainIdentifier: "nimomeng", attributeSet: attributSet)
        let tmpItems = [searchItem]
        CSSearchableIndex.default().indexSearchableItems(tmpItems) { (error) in
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemDic = dataSource[indexPath.row]
        let detailVC = DetailViewController.init(with: itemDic)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @objc func receivedNotification(sender:Notification) {
        let userInfo = sender.userInfo
        let index = Int(userInfo?["id"] as! String)
        let itemDic = dataSource[index!]
        let detailVC = DetailViewController.init(with: itemDic)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }

}

