//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by nimo on 19/03/2017.
//  Copyright © 2017 nimo. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import MediaPlayer

class ViewController: UIViewController,AVAudioPlayerDelegate {
    var audioPlayer:AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        let videoButton = UIButton()
        videoButton.setTitleColor(UIColor.blue, for: UIControlState.normal)
        videoButton.setTitle("Play Video", for: UIControlState.normal)
        videoButton.frame = CGRect(x: 50, y: 50, width: 100, height: 50)
        self.view.addSubview(videoButton)
        videoButton.addTarget(self, action: #selector(playVideo), for: UIControlEvents.touchUpInside)
        
        
        let audioPlayButton = UIButton()
        audioPlayButton.setTitleColor(UIColor.red, for: UIControlState.normal)
        audioPlayButton.setTitle("Play Audio", for: UIControlState.normal)
        audioPlayButton.frame = CGRect(x: 50, y: 150, width: 100, height: 50)
        self.view.addSubview(audioPlayButton)
        audioPlayButton.addTarget(self, action: #selector(playAudio), for: UIControlEvents.touchUpInside)
        
        let audioPauseButton = UIButton()
        audioPauseButton.setTitleColor(UIColor.red, for: UIControlState.normal)
        audioPauseButton.setTitle("Pause Audio", for: UIControlState.normal)
        audioPauseButton.frame = CGRect(x: 50, y: 250, width: 100, height: 50)
        self.view.addSubview(audioPauseButton)
        audioPauseButton.addTarget(self, action: #selector(pauseAudio), for: UIControlEvents.touchUpInside)
        
        initAudio()
        UIApplication.shared.beginReceivingRemoteControlEvents()
        initForLockScreen()
}
    
    override func viewDidAppear(_ animated: Bool) {

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func playVideo() {
        let videoUrl = URL(string: "http://down.treney.com/mov/test.mp4")
        let player = AVPlayer(url: videoUrl!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {}
        
//        let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
//        let player = AVPlayer(url: videoURL!)
//        let playerLayer = AVPlayerLayer(player: player)
//        playerLayer.frame = self.view.bounds
//        self.view.layer.addSublayer(playerLayer)
//        player.play()
    }
    
    func initAudio() {
        let audioPath = Bundle.main .path(forResource: "live", ofType: "mp3")
        let audioUrl = URL(fileURLWithPath: audioPath!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
            
        }
        catch {
            audioPlayer = nil
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayAndRecord)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("error")
        }
    }
    
    func initForLockScreen() {
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [
            MPMediaItemPropertyTitle:"皇后大道东",
            MPMediaItemPropertyArtist:"罗大佑",
            MPMediaItemPropertyArtwork:MPMediaItemArtwork(image: UIImage(named: "thumb.jpg")!),
            MPNowPlayingInfoPropertyPlaybackRate:1.0,
            MPMediaItemPropertyPlaybackDuration:audioPlayer?.duration,
            MPNowPlayingInfoPropertyElapsedPlaybackTime:audioPlayer?.currentTime
        ]
    }
    
    func playAudio() {
        audioPlayer?.play()
        
    }
    
    func pauseAudio() {
        audioPlayer?.pause()
    }
    
    override func remoteControlReceived(with event: UIEvent?) {
        switch event!.subtype {
        case .remoteControlPlay:
            audioPlayer?.play()
        case .remoteControlPause:
            audioPlayer?.pause()
        case .remoteControlStop:
            audioPlayer?.stop()
        default:
            break
        }
    }
    
}

