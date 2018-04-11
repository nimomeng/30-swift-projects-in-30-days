//
//  ViewController.swift
//  ColorGradient
//
//  Created by nimo on 24/04/2017.
//  Copyright © 2017 nimo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CAAnimationDelegate {
    
    var gradientLayer: CAGradientLayer!
    var colorSets = [[CGColor]]()
    var currentColorSet: Int!
    let brightestSkyColor_R = 21.0
    let brightestSkyColor_G = 105.0
    let brightestSkyColor_B = 203.0
    let darkestSkyColor_R = 8.0
    let darkestSkyColor_G = 33.0
    let darkestSkyColor_B = 63.0
    
    let highestTemperatureColor_R = 255.0
    let highestTemperatureColor_G = 200.0
    let highestTemperatureColor_B = 101.0
    let lowestTemperatureColor_R = 47.0
    let lowestTemperatureColor_G = 169.0
    let lowestTemperatureColor_B = 199.0
    
    let lowestTemperature = 18
    let highestTemperature = 41
    
    var totalIndex = 0
    var timeLabel : UILabel!
    var temperatureLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handelPanGesture(sender:)))
        self.view.addGestureRecognizer(panGestureRecognizer)
        createColorSets()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.createGradientLayer()
        
        timeLabel = UILabel(frame: CGRect(x: 50, y: 40, width: 100, height: 100))
        timeLabel.text = "1:00"
        timeLabel.textColor = UIColor.white
        timeLabel.font = UIFont.systemFont(ofSize: 28)
        self.view.addSubview(timeLabel)
        
        temperatureLabel = UILabel(frame: CGRect(x: 250, y: 40, width: 100, height: 100))
        temperatureLabel.text = "18 ℃"
        temperatureLabel.textColor = UIColor.white
        temperatureLabel.font = UIFont.systemFont(ofSize: 28)
        self.view.addSubview(temperatureLabel)
    }

    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        //设置渐变的主颜色
        gradientLayer.colors = colorSets[currentColorSet]
        //将gradientLayer作为子layer添加到主layer上
        self.view.layer.addSublayer(gradientLayer)
    }
    
    func createColorSets() {
        for index in 1...12 {
            colorSets.append(ColorSet(index: Double(index)))
        }
        currentColorSet = 0
    }

    var lastY:CGFloat = 0.0, lastTotalIndex = 0, deltaOrigin = 0, indexForUp = 0
    @objc func handelPanGesture(sender: UIPanGestureRecognizer) {
        let velocity = sender.velocity(in: self.view)
        let tranY = sender.translation(in: self.view).y
        if lastY == 0 || tranY * lastY < 0{
            lastY = tranY
            lastTotalIndex = totalIndex
        }
        let scopeY = self.view.frame.height / 24.0
//        time ++ up to down
        if velocity.y > 0 && totalIndex < 23{
            totalIndex = Int((tranY - lastY) /  scopeY)
            if totalIndex == 0 {
                deltaOrigin = lastTotalIndex
            }
            totalIndex += deltaOrigin
            lastTotalIndex = totalIndex
//            print("time++ : index-> \(totalIndex)")
        }
        
//        time -- down to up
        if velocity.y < 0 && totalIndex > 1{
            indexForUp = Int((tranY - lastY) / scopeY)
            if indexForUp == 0 {
                deltaOrigin = lastTotalIndex
            }
            totalIndex = deltaOrigin + indexForUp
            lastTotalIndex = totalIndex
        }
        changeColor()
        changeLabels()
    }
    
    func changeColor() {
        guard lastTotalIndex > 0 && lastTotalIndex < 24 else {
            return
        }
        if lastTotalIndex < 12 {
            gradientLayer.colors = colorSets[lastTotalIndex]
        }
        else {
            gradientLayer.colors = colorSets[23 - lastTotalIndex]
        }
    }
    
    func changeLabels() {
        guard lastTotalIndex > 0 && lastTotalIndex < 25 else {
            return
        }
        if lastTotalIndex < 12 {
            temperatureLabel.text = "\(lowestTemperature + lastTotalIndex) ℃"
        }
        else {
            temperatureLabel.text = "\(highestTemperature - lastTotalIndex) ℃"
        }
        timeLabel.text = "\(lastTotalIndex):00"
    }
    
//    index: 1 - 12
    func ColorSet(index: Double) -> Array<CGColor> {
        let sky_r = darkestSkyColor_R + (brightestSkyColor_R - darkestSkyColor_R) * (index - 1) / 11.0
        let sky_g = darkestSkyColor_G + (brightestSkyColor_G - darkestSkyColor_G) * (index - 1) / 11.0
        let sky_b = darkestSkyColor_B + (brightestSkyColor_B - darkestSkyColor_B) * (index - 1) / 11.0
        
        let tmpr_r = lowestTemperatureColor_R + (highestTemperatureColor_R - lowestTemperatureColor_R) * (index - 1) / 11.0
        let tmpr_g = lowestTemperatureColor_G + (highestTemperatureColor_G - lowestTemperatureColor_G) * (index - 1) / 11.0
        let tmpr_b = lowestTemperatureColor_B + (highestTemperatureColor_B - lowestTemperatureColor_B) * (index - 1) / 11.0
        
        return [UIColor(red: CGFloat(sky_r/255.0), green: CGFloat(sky_g/255.0), blue: CGFloat(sky_b/255.0), alpha: 1).cgColor,
                UIColor(red: CGFloat(tmpr_r/255.0), green: CGFloat(tmpr_g/255.0), blue: CGFloat(tmpr_b/255.0), alpha: 1).cgColor]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
