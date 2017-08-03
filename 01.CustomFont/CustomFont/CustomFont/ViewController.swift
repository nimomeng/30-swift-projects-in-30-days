//
//  ViewController.swift
//  CustomFont
//
//  Created by nimo on 18/03/2017.
//  Copyright © 2017 nimo. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Label
        label.text = "I am the king of the world"
        label.textAlignment = .center
        self.view.addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.centerX.equalTo(self.view)
        }
        
        label.font = UIFont.systemFont(ofSize: 30)
        
        
        // Custom change button
        let changeBtn = UIButton(type: .custom)
        changeBtn.setTitle("Change Font Family", for: .normal)
        changeBtn.addTarget(self, action: #selector(changeFont), for: .touchUpInside)
        changeBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
        self.view.addSubview(changeBtn)
        
        changeBtn.layer.borderColor = UIColor.blue.cgColor
        changeBtn.layer.borderWidth = 1
        changeBtn.layer.cornerRadius = 5
        
        changeBtn.snp.makeConstraints { (make) in
            make.top.equalTo(500)
            make.centerX.equalTo(self.view)
            make.width.equalTo(200)
        }
        
        printAllSupportedFontNames()
    }

    // Change font
    var fontRowIndex = 0
    let familyNames = UIFont.familyNames // return all available fonts in the array
    let familyNamesFontsCount = UIFont.familyNames.count // the number of available fonts
    
    func changeFont() {
        fontRowIndex += (1) % familyNamesFontsCount
        label.font = UIFont(name: familyNames[fontRowIndex], size: 20)
        print(familyNames[fontRowIndex])
    }
    
    // Print all supported fonts
    func printAllSupportedFontNames() {
        let familyNames = UIFont.familyNames
        for familyName in familyNames {
            print("++++++ \(familyName)")
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            for fontName in fontNames {
                print("----- \(fontName)")
            }
        }
    }

}

