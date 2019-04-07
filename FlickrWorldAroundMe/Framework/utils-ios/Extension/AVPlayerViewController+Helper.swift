//
//  AVPlayerViewController+Helper.swift
//  Watsons
//
//  Created by Daniele Salvioni on 03/03/2019.
//  Copyright © 2019 daniele salvioni. All rights reserved.
//

import UIKit
import AVKit

extension AVPlayerViewController
{
    class func create(localVideoPath: String,
                      showControls: Bool,
                      videoGravity: AVLayerVideoGravity,
                      backgroundColor: UIColor = UIColor.clear) -> AVPlayerViewController
    {
        let videoViewController = AVPlayerViewController()
        videoViewController.player = AVPlayer(url: URL(fileURLWithPath: localVideoPath))
        videoViewController.showsPlaybackControls = showControls
        videoViewController.videoGravity = videoGravity
        videoViewController.view.backgroundColor = backgroundColor
        return videoViewController
    }
    
    func addPlayToEndObserver(observer: Any, selector: Selector)
    {
        NotificationCenter.default.addObserver(observer, selector: selector, name: Notification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
    }
    
    func removePlayToEndObserver(observer: Any)
    {
        NotificationCenter.default.removeObserver(observer, name: Notification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
    }
    
    func playVideo()
    {
        if !((self.player?.rate != 0) && (self.player?.error == nil))
        {
            self.player?.play()
        }
    }
    
    func pauseVideo()
    {
        self.player?.pause()
    }
    
    func stopVideo()
    {
        self.player?.seek(to: CMTime(seconds: 0, preferredTimescale: 1))
        self.player?.pause()
    }
    
    func removeVideo(observer: Any? = nil)
    {
        self.player?.pause()
        self.player = nil
        if let _observer = observer { self.removePlayToEndObserver(observer: _observer) }
    }
}
