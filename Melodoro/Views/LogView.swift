//
//  LogView.swift
//  Melodoro
//
//  Created by Pak Ching Ethan Chen on 2025-05-19.
//

import SwiftUI

struct LogView: View {
    @ObservedObject var logManager: SessionLogManager
    var body: some View {
        ZStack{
            Color.orange.opacity(0.3)
                .ignoresSafeArea()
            VStack{
                Text("Session Logs")
                    .font(.largeTitle)
                    .bold()
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
                        .cornerRadius(10)
                    }
                }
                .scrollContentBackground(.hidden) // hide default list background
                .background(Color.clear) // transparent
            } .padding()
        }
        
    }
}
//
//#Preview {
//    LogView()
//}
