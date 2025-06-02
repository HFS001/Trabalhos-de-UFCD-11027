//
//  GameView.swift
//  Guess_the_number
//
//  Created by Haider Fahim on 02/06/2025.
//
import SwiftUI

struct GameView: View {
    var nomeJogador: String
    @State private var numeroSecreto = Int.random(in: 1...100)
    @State private var palpiteDoUtilizador = ""
    @State private var mensagem = "Adivinha um número entre 1 e 100!"
    
    var body: some View {
        VStack(spacing: 20) {
            Text("🎯 Olá, \(nomeJogador)!")
                .font(.title)
                .bold()
            
            Text(mensagem)
                .foregroundColor(.purple)
                .padding()
            
            TextField("Introduz o teu palpite", text: $palpiteDoUtilizador)
                .padding()
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Verificar") {
                verificarPalpite()
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Button("Novo Jogo") {
                reiniciarJogo()
            }
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .navigationTitle("Guess The Number")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func verificarPalpite() {
        if let palpite = Int(palpiteDoUtilizador) {
            if palpite == numeroSecreto {
                mensagem = "🎉 Parabéns, \(nomeJogador)! Acertaste no número!"
            } else if palpite < numeroSecreto {
                mensagem = "🔼 O número é maior!"
            } else {
                mensagem = "🔽 O número é menor!"
            }
        } else {
            mensagem = "⚠️ Introduz um número válido!"
        }
    }
    
    func reiniciarJogo() {
        numeroSecreto = Int.random(in: 1...100)
        palpiteDoUtilizador = ""
        mensagem = "Adivinha um número entre 1 e 100!"
    }
}
