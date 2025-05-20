//
//  ContentView.swift
//  Melodoro
//
//  Created by Pak Ching Ethan Chen on 2025-04-19.
//

import SwiftUI

struct TimerView: View {
    @ObservedObject var alogManager: SessionLogManager
    @ObservedObject var timerManager: TimerManager
    @State var soundOn = true
    
    init(alogManager: SessionLogManager) {
        self.alogManager = alogManager
        self.timerManager = TimerManager(
            timeRemaining: 1500,
            running: false,
            focusTime: true,
            focusDuration: 1500,
            breakDuration: 300,
            sessionLogManager: alogManager, // 👈 You pass it into the timer
            timeElapsed: 0
        )
    }
    var body: some View {
        VStack {
            Button(action: {
                                soundOn.toggle()
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
                            // Only log if time has actually passed
                                if timerManager.timeElapsed > 0 {
                                    var focusTimeLogged = 0
                                    var breakTimeLogged = 0

                                    if timerManager.focusTime {
                                        focusTimeLogged = timerManager.timeElapsed
                                    } else {
                                        breakTimeLogged = timerManager.timeElapsed
                                    }

                                    timerManager.sessionLogManager.addLog(
                                        focus: focusTimeLogged,
                                        breakTime: breakTimeLogged,
                                        completed: false
                                    )
                                    
                                    // Reset the elapsed timer
                                    timerManager.timeElapsed = 0
                                }
                            
                            timerManager.switchMode()
                            timerManager.pause()
                        }
                    } else {
                        Button("Start") {
                            timerManager.start()
                        }
                    }
                Button("Pause") {
                    timerManager.pause()
                }
            }
        }
        .padding()

    }
    var formattedTime: String{
        let minutes = timerManager.timeRemaining / 60
        let seconds = timerManager.timeRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    TimerView(alogManager: SessionLogManager())
}
