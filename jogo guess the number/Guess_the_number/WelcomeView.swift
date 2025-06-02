//
//  WelcomeView.swift
//  Guess_the_number
//
//  Created by Haider Fahim on 02/06/2025.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var nomeJogador: String
    @Binding var iniciarJogo: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Text("🎉 Bem-vindo ao Jogo Guess the Number!")
                .font(.title)
                .multilineTextAlignment(.center)
            
            TextField("Escreve o teu nome", text: $nomeJogador)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            NavigationLink(destination: GameView(nomeJogador: nomeJogador)) {
                           Text("Começar o Jogo")
                               .padding()
                               .background(Color.blue)
                               .foregroundColor(.white)
                               .cornerRadius(10)
                       }
                   }
                   .padding()
                   .navigationTitle("Menu")
               }
           }
