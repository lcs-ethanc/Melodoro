//
//  MusicPlayer.swift
//  Melodoro
//
//  Created by Pak Ching Ethan Chen on 2025-05-22.
//

import AVFoundation

class MusicPlayer {
    var audioPlayer: AVAudioPlayer? //optional as starts as nil until track is loaded
    
    func playMusic(fileName: String) {
        //looks in assets for mp3 file with given name
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
            print("Music file not found: \(fileName)")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url) //try to load file into audio player
            audioPlayer?.numberOfLoops = -1 //loop forever
            audioPlayer?.play()
        } catch { //if the loading or playback fails
            print("Failed to play music: \(error)")
        }
    }
}
