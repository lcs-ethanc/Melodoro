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
            HStack{
                Toggle("Piano", isOn: userSettings.binding(genre:"Piano"))
                Toggle("Lofi", isOn: userSettings.binding(genre:"Lofi"))
            }
        }

  
    }
}

//#Preview {
//    SettingsView()
//}
