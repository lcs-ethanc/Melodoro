//
//  SessionLog.swift
//  Melodoro
//
//  Created by Pak Ching Ethan Chen on 2025-05-18.
//

import Foundation

struct SessionLog: Identifiable, Codable {
    let id : UUID
    let sessionDate: Date
    let focusDuration: Int
    let breakDuration: Int
    let completed: Bool
    
    init(
        id: UUID = UUID(),
        sessionDate: Date,
        focusDuration: Int,
        breakDuration: Int,
        completed: Bool
    ) {
        self.id = id
        self.sessionDate = sessionDate
        self.focusDuration = focusDuration
        self.breakDuration = breakDuration
        self.completed = completed
    }
}
