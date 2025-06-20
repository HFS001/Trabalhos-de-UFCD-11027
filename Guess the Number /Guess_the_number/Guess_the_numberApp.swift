import SwiftUI

@main
struct Guess_the_numberApp: App {
    @StateObject var appState = AppState()
    @StateObject var jogadoresData = JogadoresData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .id(appState.restartID) 
                .environmentObject(appState)
                .environmentObject(jogadoresData)
        }
    }
}
