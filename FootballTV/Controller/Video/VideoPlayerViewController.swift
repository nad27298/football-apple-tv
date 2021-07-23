//
//  VideoPlayerViewController.swift
//  FootballTV
//
//  Created by nguyenhuyson2 on 11/22/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import Foundation
import UIKit
import AVKit

class VideoPlayerViewController: AVPlayerViewController {
    
    // MARK: - Properties
    let overlay = UIView(frame: CGRect(x: 100, y: 100, width: 285, height: 225))
//    let watermark = "Video"
    var url: String = ""
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setVideoPlayer()
    }
}

//MARK: - VideoPlayer -> VideoPlayerViewController Extension
typealias VideoPlayer = VideoPlayerViewController
extension VideoPlayer {
    
    /// set video player for view
    func setVideoPlayer() {
        // watermark overlay (logo tv by example..)
//        overlay.addSubview(UIImageView(image: UIImage(named: watermark)))
        contentOverlayView?.addSubview(overlay)
        
        // AVPlayer Instance with NSURL
        player = AVPlayer(url: URL(string: url)!)
        
        // Just Play!
        player?.play()
    }
}
