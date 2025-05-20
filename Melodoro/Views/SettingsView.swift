//
//  SettingsView.swift
//  Melodoro
//
//  Created by Pak Ching Ethan Chen on 2025-05-19.
//

import SwiftUI

struct SettingsView: View {
    @State private var userSettings = UserSettings(
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
    }
}

#Preview {
    SettingsView()
}
