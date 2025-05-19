//
//  TimerManager.swift
//  Melodoro
//
//  Created by Pak Ching Ethan Chen on 2025-05-19.
//

import Foundation

class TimerManager {
    var timer: Timer?
    var timeRemaining: Int
    var running: Bool = false
    var focusTime: Bool = true
    
    let focusDuration: Int
    let breakDuration: Int
    
    init(timer: Timer? = nil, timeRemaining: Int, running: Bool, focusTime: Bool, focusDuration: Int, breakDuration: Int) {
        self.timer = timer
        self.timeRemaining = timeRemaining
        self.running = running
        self.focusTime = focusTime
        self.focusDuration = focusDuration
        self.breakDuration = breakDuration
    }
}
