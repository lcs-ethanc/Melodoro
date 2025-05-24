//
//  TimerManager.swift
//  Melodoro
//
//  Created by Pak Ching Ethan Chen on 2025-05-19.
//

import Foundation

class TimerManager: ObservableObject { //to watch for changes
    var timer: Timer?
    @Published var timeRemaining: Int //to refresh whenever changed
    @Published var running: Bool = false
    @Published var focusTime: Bool = true
    

    
    var userSettings: UserSettings
    var sessionLogManager: SessionLogManager
    
    var focusTimeElapsed: Int = 0
    var breakTimeElapsed: Int = 0
    var completedFocus = false
    
    init(timer: Timer? = nil, timeRemaining: Int, running: Bool, focusTime: Bool, userSettings: UserSettings, sessionLogManager: SessionLogManager, focusTimeElapsed: Int, breakTimeElapsed: Int, completedFocus: Bool = false) {
        self.timer = timer
        self.timeRemaining = timeRemaining
        self.running = running
        self.focusTime = focusTime
        self.userSettings = userSettings
        self.sessionLogManager = sessionLogManager
        self.focusTimeElapsed = focusTimeElapsed
        self.breakTimeElapsed = breakTimeElapsed
        self.completedFocus = completedFocus
    }
    
    func start () {
        
        if running{
            return
        }
        running = true //Timer is running
        
        //Timer repeats every 1 second
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            
            //If timer is above 0, minus one to timer (self = this instance)
            if self.timeRemaining > 0 {
                self.timeRemaining += -1
                if self.focusTime{
                    self.focusTimeElapsed += 1
                } else{
                    self.breakTimeElapsed += 1
                }
                print("Time remaining: \(self.timeRemaining)")
            } else {
                self.switchMode()
            }
        }
    }
    
    func switchMode() {
        //Stop timer
        pause()
        
        //Set completed focus to true if from focus to break
        if !focusTime {
            completedFocus = true
        }
        
        //Log if from break --> focus
        if focusTime == false && completedFocus {
            sessionLogManager.addLog(
                focus: focusTimeElapsed,
                breakTime: breakTimeElapsed,
                    completed: true
                )
                print("Logged a completed cycle.")
                completedFocus = false
            
                //Reset elapsed
                focusTimeElapsed = 0
                breakTimeElapsed = 0
            }
        
        
        
        //Toggle between focus and break
        focusTime.toggle()
        
        
        //Switch to timer of either focus or duration
        if focusTime {
            timeRemaining = Int(userSettings.defaultFocusDuration*60)
        } else {
            timeRemaining = Int(userSettings.defaultBreakDuration*60)
        }
        
        //Depending on which one has been switched to, print it
        if focusTime {
            print("Switched to Focus mode")
        } else {
            print("Switched to Break Mode")
        }
        
    }
    
    func pause() {
        timer?.invalidate() //Stops timer from running if timer is not nil
        running = false //Changes label of "running" to false
    }
}
