//
//  AudioPlayer.swift
//  Restart
//
//  Created by Kirill Sytkov on 26.06.2022.
//

import Foundation
import AVFoundation



    
    var audioPlayer: AVAudioPlayer?

     func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                debugPrint("Could not play the sound \(error)")
            }
        }
    }


