//
//  SessionLogManager.swift
//  Melodoro
//
//  Created by Pak Ching Ethan Chen on 2025-05-19.
//

import Foundation

class SessionLogManager: ObservableObject{
    @Published var logs: [SessionLog] = [] //list of session logs
    
    func addLog(focus:Int, breakTime:Int, completed:Bool) { //add new session log
        let newLog = SessionLog( //copy values into new log
            sessionDate: Date(),
            focusDuration: focus,
            breakDuration: breakTime,
            completed: completed
        )
        logs.append(newLog) //append new log
    }
}
