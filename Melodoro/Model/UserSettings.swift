//
//  UserSettings.swift
//  Melodoro
//
//  Created by Pak Ching Ethan Chen on 2025-05-18.
//

import Foundation
import SwiftUI

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
    
    func enabledGenres() -> [String] { //will return an array of string
        genreToggles
            .filter { pair in //filters out pairs with toggle turned to true
            pair.value == true
        }
            .map { pair in //makes a list of genre names (keys)
                pair.key
            }
    }
    func binding(genre: String) -> Binding<Bool> {
        return Binding<Bool>(
            get: {
                if let value = self.genreToggles[genre] { //check if genre exists
                    return value // return the genre
                } else {
                    return false // if not found, default to false
                }
            },
            set: { newValue in
                //updates true/false of the actual item in the list
                self.genreToggles[genre] = newValue
            }
        )
    }

}

