//
//  MusicManager.swift
//  Melodoro
//
//  Created by Pak Ching Ethan Chen on 2025-05-22.
//

import Foundation

class MusicManager {
    let musicPlayer = MusicPlayer() //holds instance of musicplayer
    
    func playRandomGenre(genres: [String]) { //function that takes in a list of genres (string)
        guard let randomGenre = genres.randomElement() else {  //randomly picks a genre
            print ("No genres enabled to play")
            return
        }
        musicPlayer.playMusic(fileName: randomGenre) //play the random genre
    }
    func stopMusic() {
        musicPlayer.stopMusic() //stop the music
    }
}
