//
//  CenterViewController.swift
//  snapChatLikeApp
//
//  Created by nimo on 25/03/2017.
//  Copyright © 2017 nimo. All rights reserved.
//

import UIKit

class CenterViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    var imagePicker : UIImagePickerController!
    var imageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor.yellow;
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        imageView.backgroundColor = UIColor.yellow
        self.view.addSubview(imageView)
        
        let tempBtn = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        tempBtn.setTitle("TestBtn", for: UIControlState.normal)
        tempBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
        self.view.addSubview(tempBtn)
        tempBtn.addTarget(self, action: #selector(clicked), for: UIControlEvents.touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        imagePicker = UIImagePickerController()
//        imagePicker.delegate = self;
//        imagePicker.sourceType = .camera
//        
//        self.present(imagePicker, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }

    func clicked() {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self;
        imagePicker.sourceType = .camera
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
