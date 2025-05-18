//
//  UserSettings.swift
//  Melodoro
//
//  Created by Pak Ching Ethan Chen on 2025-05-18.
//

import Foundation

struct UserSettings {
    var defaultFocusDuration: Int       // in minutes
    var defaultBreakDuration: Int       // in minutes
    var genreToggles: [String:Bool]     // e.g., "lofi", "nature", "piano"
    var notificationsEnabled: Bool
}
