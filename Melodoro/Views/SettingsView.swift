//
//  SettingsView.swift
//  Melodoro
//
//  Created by Pak Ching Ethan Chen on 2025-05-19.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var userSettings: UserSettings
    var body: some View {
        VStack{
            Text("Timer Durations")
                                .font(.headline)
                                .padding()
            HStack{
                VStack(alignment: .leading) {
                    Text("Focus Time: \(userSettings.defaultFocusDuration.formatted()) min")
                    Slider(value: $userSettings.defaultFocusDuration, in: 5...60, step: 1)
                               }
                VStack(alignment: .leading) {
                    Text("Break Time: \(userSettings.defaultBreakDuration.formatted()) min")
                    Slider(value: $userSettings.defaultBreakDuration, in: 1...30, step: 1)
                               }
                
            } .padding()
            Text("Music Genre Range")
                .font(.headline)
                .padding()
            
            HStack{
                GenreToggle(genre: "Piano", userSettings: userSettings)
                    
                GenreToggle(genre: "Lofi", userSettings: userSettings)
                  
            }
            HStack{
                GenreToggle(genre: "Classical", userSettings: userSettings)
                GenreToggle(genre: "Jazz", userSettings: userSettings)
            }
            HStack{
                GenreToggle(genre: "Techno", userSettings: userSettings)
                GenreToggle(genre: "Nature", userSettings: userSettings)
            }
            HStack{
                GenreToggle(genre: "Instrumental", userSettings: userSettings)
                GenreToggle(genre: "Ambient", userSettings: userSettings)
            }
        }

  
    }
}

//#Preview {
//    SettingsView()
//}
