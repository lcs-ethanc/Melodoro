//
//  SettingsView.swift
//  Melodoro
//
//  Created by Pak Ching Ethan Chen on 2025-05-19.
//

import SwiftUI

struct SettingsView: View {
    
    @State var userSettings = UserSettings(
        defaultFocusDuration: 25,
        defaultBreakDuration: 5,
        genreToggles: [
            "Lofi": true,
            "Nature": true,
            "Jazz": true,
            "Classical": true,
            "Piano": true,
            "Instrumental": true,
            "Techno": true,
            "Ambient": true
        ],
        soundToggle: true
    )
    var body: some View {
        Text("Timer Durations")
                            .font(.headline)
        HStack{
            VStack(alignment: .leading) {
                Text("Focus Time: \(userSettings.defaultFocusDuration.formatted()) min")
                Slider(value: $userSettings.defaultFocusDuration, in: 5...60, step: 1)
                           }
            VStack(alignment: .leading) {
                Text("Break Time: \(userSettings.defaultBreakDuration.formatted()) min")
                Slider(value: $userSettings.defaultBreakDuration, in: 1...30, step: 1)
                           }
        }
  
    }
}

#Preview {
    SettingsView()
}
