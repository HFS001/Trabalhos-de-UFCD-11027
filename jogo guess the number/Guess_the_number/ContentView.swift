//
//  ContentView.swift
//  Guess_the_number
//
//  Created by Haider Fahim on 30/05/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var nomeJogador = ""
    @State private var iniciarJogo = false
    
    var body: some View {
        NavigationStack {
            if iniciarJogo {
                GameView(nomeJogador: nomeJogador)
            } else {
                WelcomeView(nomeJogador: $nomeJogador, iniciarJogo: $iniciarJogo)
            }
        }
    }
}

#Preview {
    ContentView()
}


