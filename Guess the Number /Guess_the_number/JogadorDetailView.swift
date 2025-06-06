//
//  JogadorDetailView.swift
//  Guess_the_number
//
//  Created by Haider Fahim on 06/06/2025.
//

import SwiftUI

import SwiftUI

struct JogadorDetailView: View {
    var jogador: Jogador

    var body: some View {
        VStack(spacing: 20) {
            Text("👤 Nome: \(jogador.nome)")
                .font(.title2)
            Text("🎯 Tentativas totais: \(jogador.tentativas)")
            Text("🏆 Vitórias: \(jogador.vitorias)")
        }
        .padding()
        .navigationTitle("Detalhes")
    }
}
