//
//  ContentView.swift
//  Melodoro
//
//  Created by Pak Ching Ethan Chen on 2025-04-19.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var alogManager: SessionLogManager
    @StateObject var timerManager: TimerManager
    @EnvironmentObject var userSettings: UserSettings
    
    @State var soundOn = true
    
    @EnvironmentObject var musicManager : MusicManager
    
    var circleColor: Color {
        if !timerManager.running {
            return .yellow
        } else if timerManager.focusTime {
            return .green
        } else {
            return .blue // or .purple for break mode
        }
    }
    var circleOpacity: Double {
        var totalDuration: Double = 1 // Default to 1 to avoid division by zero
        if timerManager.focusTime == true {
            totalDuration = userSettings.defaultFocusDuration * 100
        } else {
            totalDuration = userSettings.defaultBreakDuration * 100
        }

        var progress = Double(timerManager.timeRemaining) / totalDuration

        // Clamp manually without `clamped(to:)`
        if progress > 1 {
            progress = 1
        } else if progress < 0 {
            progress = 0
        }

        return progress
    }

    var formattedTime: String{
        let minutes = timerManager.timeRemaining / 60
        let seconds = timerManager.timeRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    
    var body: some View {
        ZStack{
            //Background
            Color.blue.opacity(0.2)
                .ignoresSafeArea()
            
            Circle()
                .fill(circleColor)
                  .frame(width:300, height:300)
                  .opacity(circleOpacity)
                  .padding(.top,30)
            VStack {
                Button(action: {
                    soundOn.toggle()
                    if soundOn == true { //if sound toggle is on
                        if timerManager.running { //if the timer is running
                            musicManager.musicPlayer.resumeMusic()//play music
                        }
                    } else { //if sound toggle off
                        musicManager.musicPlayer.pauseMusic() //stop music
                    }
                }) {
                    Image(systemName: soundOn ? "speaker.wave.2.fill" : "speaker.slash.fill")
                        .foregroundColor(.primary)
                        .frame(width:24,height:24)
                }
                .padding()
                
                //Mode text
                if timerManager.focusTime {
                    Text("Focus Time")
                        .font(.title)
                } else{
                    Text("Break Time")
                        .font(.title)
                }
                //Countdown text
                Text(formattedTime)
                    .font(.system(size:48, weight: .bold))
                
                HStack{
                    if timerManager.running {
                        Button("Skip") {
                            timerManager.switchMode()
                            timerManager.pause()
                            musicManager.stopMusic()
                        } .foregroundColor(.black)
                    } else {
                        Button("Start") {
                            timerManager.start()
                            if soundOn {
                                musicManager.playRandomGenre(genres: userSettings.enabledGenres())
                            }
                        } .foregroundColor(.black)
                    }
                    Button("Pause") {
                        timerManager.pause()
                        musicManager.stopMusic()
                    } .foregroundColor(.black)
                }
            }
            .padding()
        }
        
    }

    
}

//#Preview {
//    TimerView(
//        timerManager: TimerManager(
//            timeRemaining: Int(userSettings.defaultFocusDuration*60),
//            running: false,
//            focusTime: true,
//            userSettings: userSettings,
//            sessionLogManager: logManager,
//            focusTimeElapsed: 0,
//            breakTimeElapsed: 0
//        )
//    )
//}
