//
//  ContentView.swift
//  Melodoro
//
//  Created by Pak Ching Ethan Chen on 2025-04-19.
//

import SwiftUI

struct TimerView: View {
    @ObservedObject var timerManager = TimerManager(
        timeRemaining: 1500,
        running: false,
        focusTime: true,
        focusDuration: 1500,
        breakDuration: 300
    )

    
    var body: some View {
        VStack {
            
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
                Button("Start") {
                    timerManager.start()
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
    TimerView()
}
