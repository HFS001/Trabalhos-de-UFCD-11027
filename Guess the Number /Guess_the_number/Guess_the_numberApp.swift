//
//  Guess_the_numberApp.swift
//  Guess_the_number
//
//  Created by Haider Fahim on 30/05/2025.
//

import SwiftUI

@main
struct Guess_the_numberApp: App {
    @StateObject var appState = AppState()
    @StateObject var jogadoresData = JogadoresData() // 🔥 Move this here

    var body: some Scene {
        WindowGroup {
            ContentView()
                .id(appState.restartID) // forces view reload
                .environmentObject(appState)
                .environmentObject(jogadoresData) // 💡 inject jogadoresData globally
        }
    }
}
