//
//  SessionLogManager.swift
//  Melodoro
//
//  Created by Pak Ching Ethan Chen on 2025-05-19.
//

import Foundation

class SessionLogManager: ObservableObject{
    @Published var logs: [SessionLog] = [] //list of session logs
    
    var savePath: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0].appendingPathComponent("SessionLogs.json")
    }
    
    init() {
            loadLogs()
        }
    
    func saveLogs() {
        do {
            let data = try JSONEncoder().encode(logs)
            try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
            print("Logs saved.")
        } catch {
            print("Failed to save logs: \(error)")
        }
    }
    func loadLogs() {
        do {
            let data = try Data(contentsOf: savePath)
            logs = try JSONDecoder().decode([SessionLog].self, from: data)
            print("Logs loaded.")
        } catch {
            print("No logs found or failed to load: \(error)")
        }
    }
    
    func addLog(focus:Int, breakTime:Int, completed:Bool) { //add new session log
        let newLog = SessionLog( //copy values into new log
            sessionDate: Date(),
            focusDuration: focus,
            breakDuration: breakTime,
            completed: completed
        )
        logs.append(newLog) //append new log
        saveLogs()
    }
}
