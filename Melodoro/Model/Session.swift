//
//  Session.swift
//  Melodoro
//
//  Created by Pak Ching Ethan Chen on 2025-04-19.
//

import Foundation

struct Session: Identifiable {
    let id = UUID()
    let focusDuration: Int
    let breakDuration: Int
    let completed: Bool
}
