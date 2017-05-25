//
//  HexStringColor.swift
//  ColorGradient
//
//  Created by nimo on 24/04/2017.
//  Copyright © 2017 nimo. All rights reserved.
//

import Foundation
import UIKit


extension String {
    
    ///  Translate Hex String to UIColor, support following formats:
    ///  "00ffff", "#00ffff", "0x00ffff"
    ///
    func toUIColor() -> UIColor {
        
        guard (self.hasPrefix("#") && self.characters.count == 7) ||
            (self.hasPrefix("0x") && self.characters.count == 8) ||
            (self.characters.count == 6) else {
                return UIColor.red
        }
        
        var origin = self
        
        if (self.hasPrefix("#")) {
            origin = origin[1..<origin.characters.count]
        }
        else if (self.hasPrefix("0x")) {
            origin = origin[2..<origin.characters.count]
        }
        
        var red:UInt32 = 0, green:UInt32 = 0, blue:UInt32 = 0
        Scanner(string: origin[0..<2]).scanHexInt32(&red)
        Scanner(string: origin[2..<4]).scanHexInt32(&green)
        Scanner(string: origin[4..<6]).scanHexInt32(&blue)
        return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
}
