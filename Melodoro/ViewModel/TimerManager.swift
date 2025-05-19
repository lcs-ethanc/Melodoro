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
    
    func start () {
        running = true //Timer is running
        
        //Timer repeats every 1 second
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            
            //If timer is above 0, minus one to timer (self = this instance)
            if self.timeRemaining > 0 {
                self.timeRemaining += -1
                print("Time remaining: \(self.timeRemaining)")
            } else {
                self.switchMode()
            }
        }
    }
    
    func switchMode() {
        //Stop timer
        pause()
        
        //Toggle between focus and break
        focusTime.toggle()
        
        //Switch to timer of either focus or duration
        if focusTime {
            timeRemaining = focusDuration
        } else {
            timeRemaining = breakDuration
        }
        
        print ("Switched to \(focusTime ? "Focus" : "Break") mode")
        
        //Start timer
        start()
    }
    
    func pause() {
        timer?.invalidate() //Stops timer from running if timer is not nil
        running = false //Changes label of "running" to false
    }
}
