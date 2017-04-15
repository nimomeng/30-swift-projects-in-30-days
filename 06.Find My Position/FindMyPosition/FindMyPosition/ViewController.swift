//
//  ViewController.swift
//  FindMyPosition
//
//  Created by nimo on 15/04/2017.
//  Copyright © 2017 nimo. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    let locationLabel = UILabel()
    let locationStrLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        locationLabel.frame = CGRect(x: 0, y: 100, width: 400, height: 100)
        locationLabel.numberOfLines = 3
        self.view.addSubview(locationLabel)
        locationStrLabel.frame = CGRect(x: 0, y: 200, width: 400, height: 100)
        locationStrLabel.numberOfLines = 5
        self.view.addSubview(locationStrLabel)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locations : NSArray = locations as NSArray
        let currentLocation = locations.lastObject as! CLLocation
        let locationStr = "lat:\(currentLocation.coordinate.latitude) lng:\(currentLocation.coordinate.longitude)"
        locationLabel.text = locationStr
        reverseGeocode(location:currentLocation)
        locationManager.stopUpdatingLocation()
    }
    
    ///将经纬度转换为城市名
    func reverseGeocode(location:CLLocation) {
        geocoder.reverseGeocodeLocation(location) { (placeMark, error) in
            if(error == nil) {
                let tempArray = placeMark! as NSArray
                let mark = tempArray.firstObject as! CLPlacemark
//                now begins the reverse geocode
                let addressDictionary = mark.addressDictionary! as NSDictionary
                let country = addressDictionary.value(forKey: "Country") as! String
                let city = addressDictionary.object(forKey: "City") as! String
                let subLocation = addressDictionary.object(forKey: "SubLocality") as! String
                let street = addressDictionary.object(forKey: "Street") as! String
                
                let finalAddress = "Country: \(country) ; City: \(city) ; Sublocation: \(subLocation) ; Street: \(street)"
                self.locationStrLabel.text = finalAddress

            }
        }
    }
}

