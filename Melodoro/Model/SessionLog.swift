//
//  SessionLog.swift
//  Melodoro
//
//  Created by Pak Ching Ethan Chen on 2025-05-18.
//

import Foundation

struct SessionLog: Identifiable {
    let id = UUID()
    let sessionDate: Date
    let focusDuration: Int
    let breakDuration: Int
    let completed: Bool
}
