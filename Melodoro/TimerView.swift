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
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    TimerView()
}
