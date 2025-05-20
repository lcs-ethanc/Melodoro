//
//  ContentView.swift
//  Melodoro
//
//  Created by Pak Ching Ethan Chen on 2025-04-19.
//

import SwiftUI

struct TimerView: View {
    @State var timerManager = TimerManager(
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
            
            Text(formattedTime)
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
