//
//  fetchSubString.swift
//  ColorGradient
//
//  Created by nimo on 24/04/2017.
//  Copyright © 2017 nimo. All rights reserved.
//

import Foundation

// support fetching subString by subscribe
extension String {
    subscript (r:Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
            return String(self[startIndex..<endIndex])
        }
    }
}
