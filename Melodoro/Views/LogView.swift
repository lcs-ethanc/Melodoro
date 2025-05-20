//
//  LogView.swift
//  Melodoro
//
//  Created by Pak Ching Ethan Chen on 2025-05-19.
//

import SwiftUI

struct LogView: View {
    @ObservedObject var blogManager: SessionLogManager
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    LogView(blogManager: SessionLogManager())
}
