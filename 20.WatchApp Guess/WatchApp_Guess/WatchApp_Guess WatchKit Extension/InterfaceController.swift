//
//  InterfaceController.swift
//  WatchApp_Guess WatchKit Extension
//
//  Created by nimo on 2017/5/20.
//  Copyright © 2017年 nimoAndHisFriends. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController,WCSessionDelegate {
    @IBOutlet var resultSlider: WKInterfaceSlider!
    @IBOutlet var resultLabel: WKInterfaceLabel!
    @IBOutlet var resultConfirmButton: WKInterfaceButton!

    @IBOutlet var resultOfGuess: WKInterfaceLabel!
    
    var numberToBeGuessed: Int!
    var numberOfSlider: Int = 3
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    @IBAction func sliderUpdate(_ value: Float) {
        numberOfSlider = Int(value * 5)
        resultLabel.setText("Your guess: \(numberOfSlider)")
    }
    
    @IBAction func guessAction() {
        if numberToBeGuessed == nil {
            resultOfGuess.setText("Open iPhone App first")
        }
        else if numberOfSlider == numberToBeGuessed {
            resultOfGuess.setText("回答正确❤️")
        }
        else {
            resultOfGuess.setText("再猜一次💔")
        }
    }
    
    override func willActivate() {
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        numberToBeGuessed = applicationContext["numberToBeGuessed"] as! Int
    }
}
