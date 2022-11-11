//
//  PlaySound.swift
//  Slot Machine
//
//  Created by Kirill Sytkov on 11.11.2022.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            debugPrint(error)
        }
    }
}
