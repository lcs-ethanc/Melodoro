//
//  LogView.swift
//  Melodoro
//
//  Created by Pak Ching Ethan Chen on 2025-05-19.
//

import SwiftUI

struct LogView: View {
    @EnvironmentObject var logManager: SessionLogManager
    var body: some View {
        NavigationStack{
            List {  
                ForEach(logManager.logs.reversed()) {  log in
                    VStack{
                        Text(log.sessionDate.formatted())
                        Text("Focus: \(log.focusDuration) sec")
                        Text("Break: \(log.breakDuration) sec")
                        if log.completed {
                            Text("Completed")
                        } else {
                            Text("Skipped")
                        }
                    }
                }
            }
        } .navigationTitle("Session Logs")
        
    }
}

#Preview {
    LogView()
}
