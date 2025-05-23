//
//  GenreToggle.swift
//  Melodoro
//
//  Created by Pak Ching Ethan Chen on 2025-05-23.
//

import SwiftUI

struct GenreToggle: View{
    let genre: String
    @ObservedObject var userSettings: UserSettings
    
    var body: some View{
        Toggle(genre, isOn: userSettings.binding(genre: genre))
            .toggleStyle(.button)
            .background(userSettings.genreToggles[genre] == true ? Color.green : Color.red)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .foregroundColor(.black)
            .font(.system(size:20))
    }
    
}
