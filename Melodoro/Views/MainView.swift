//
//  MainView.swift
//  Melodoro
//
//  Created by Pak Ching Ethan Chen on 2025-05-19.
//

import SwiftUI

struct MainView: View {
    @State var selectedPage = 1
    @StateObject var logManager = SessionLogManager()
    @StateObject var userSettings = UserSettings(
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
        ]
    )
    var body: some View {
        TabView(selection:$selectedPage){
            SettingsView()
                .tag(0)
            TimerView(
                timerManager: TimerManager(
                    timeRemaining: Int(userSettings.defaultFocusDuration*60),
                    running: false,
                    focusTime: true,
                    userSettings: userSettings,
                    sessionLogManager: logManager,
                    focusTimeElapsed: 0,
                    breakTimeElapsed: 0
                )
            )
                .tag(1)
            LogView()
        }
        .environmentObject(userSettings)
        .environmentObject(logManager)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

#Preview {
    MainView()
}
