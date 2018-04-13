//
//  CenterViewController.swift
//  snapChatLikeApp
//
//  Created by nimo on 25/03/2017.
//  Copyright © 2017 nimo. All rights reserved.
//

import UIKit
import AVFoundation

class CenterViewController: UIViewController,AVCapturePhotoCaptureDelegate {
    var imageView: UIImageView!
    
    var captureSesssion: AVCaptureSession!
    var stillImageOutput: AVCapturePhotoOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        captureSesssion = AVCaptureSession()
        captureSesssion.sessionPreset = AVCaptureSession.Preset.photo
        
        self.imageView = UIImageView(frame: self.view.bounds)
        self.view.addSubview(self.imageView)
        
        let captureBtn = UIButton()
        captureBtn.frame.size = CGSize(width: 48, height: 48)

        captureBtn.center.x = self.view.center.x
        captureBtn.frame.origin.y = self.view.frame.height - 100
        captureBtn.setImage(UIImage(named:"takePhoto"), for: UIControlState.normal)
        captureBtn.addTarget(self, action: #selector(takePhoto), for: UIControlEvents.touchUpInside)
        self.view.addSubview(captureBtn)
        
        let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        do {
            let input = try AVCaptureDeviceInput(device: device)
            if (captureSesssion.canAddInput(input)) {
                captureSesssion.addInput(input)
                stillImageOutput = AVCapturePhotoOutput()
                if (captureSesssion.canAddOutput(stillImageOutput)) {
                    captureSesssion.addOutput(stillImageOutput)
                    
                    let captureVideoLayer: AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer.init(session: captureSesssion)
                    captureVideoLayer.frame = self.imageView.bounds
                    captureVideoLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
                    self.imageView.layer.addSublayer(captureVideoLayer)
                    
                    captureSesssion.startRunning()
                }
            }
        }
            
        catch {
            print(error)
        }
    }
    
//    MARK: - Button Action
    
    func takePhoto(_ sender: Any){
        
//        Animation for taking photos
        DispatchQueue.main.async { [unowned self] in
            self.view.layer.opacity = 0
            UIView.animate(withDuration: 0.25) { [unowned self] in
                self.view.layer.opacity = 1
            }
        }
        
        let settingsForMonitoring = AVCapturePhotoSettings()
        settingsForMonitoring.flashMode = .auto
        settingsForMonitoring.isAutoStillImageStabilizationEnabled = true
        settingsForMonitoring.isHighResolutionPhotoEnabled = false
        stillImageOutput?.capturePhoto(with: settingsForMonitoring, delegate: self)
    }
    
//    MARK: - AVCapturePhotoCaptureDelegate
    func photoOutput(_ captureOutput: AVCapturePhotoOutput, didFinishProcessingPhoto photoSampleBuffer: CMSampleBuffer?, previewPhoto previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
        if let photoSampleBuffer = photoSampleBuffer {
            let photoData = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: photoSampleBuffer, previewPhotoSampleBuffer: previewPhotoSampleBuffer)
            let image = UIImage(data: photoData!)
            UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        }
    }
}
