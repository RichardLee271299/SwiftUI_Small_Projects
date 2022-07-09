//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Kirill Sytkov on 09.07.2022.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
   if let video = Bundle.main.url(forResource: fileName, withExtension: fileFormat) {
      videoPlayer = AVPlayer(url: video)
      videoPlayer?.play()
   } 
   return videoPlayer!
}
