//
//  MainView.swift
//  Melodoro
//
//  Created by Pak Ching Ethan Chen on 2025-05-19.
//

import SwiftUI

struct MainView: View {
    @State var selectedPage = 1
    @StateObject var logManager = SessionLogManager()
    var body: some View {
        TabView(selection:$selectedPage){
            SettingsView()
                .tag(0)
            TimerView(alogManager: logManager)
                .tag(1)
            LogView(blogManager: logManager)
        }

        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

#Preview {
    MainView()
}
