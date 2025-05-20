//
//  UserSettings.swift
//  Melodoro
//
//  Created by Pak Ching Ethan Chen on 2025-05-18.
//

import Foundation

class UserSettings: ObservableObject {
    @Published var defaultFocusDuration: Double
    @Published var defaultBreakDuration: Double
    @Published var genreToggles: [String:Bool]
    
    init(
        defaultFocusDuration: Double,
        defaultBreakDuration: Double,
        genreToggles: [String : Bool]
    ) {
        self.defaultFocusDuration = defaultFocusDuration
        self.defaultBreakDuration = defaultBreakDuration
        self.genreToggles = genreToggles
    }
}

