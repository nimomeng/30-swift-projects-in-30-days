//
//  TodayViewController.swift
//  WatchTodayExtension
//
//  Created by nimo on 2017/5/18.
//  Copyright © 2017年 nimo. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    @IBOutlet weak var currentTime: UILabel!
    var timer: Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefaults = UserDefaults(suiteName: "group.nimoAndHisFriend.watchDemo")
        var leftTimeWhenQuit = userDefaults?.double(forKey: "lefttime")
        
        currentTime.text = String(format: "%0.1f", leftTimeWhenQuit!)
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (Timer) in
            leftTimeWhenQuit = leftTimeWhenQuit! + 0.1
            
            self.currentTime.text = String(format: "%0.1f", leftTimeWhenQuit!)
        }
        self.timer.fire()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        completionHandler(NCUpdateResult.newData)
    }
    
}
