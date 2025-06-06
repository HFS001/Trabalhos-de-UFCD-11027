//
//  Jogador.swift
//  Guess_the_number
//
//  Created by Haider Fahim on 06/06/2025.
//
import SwiftUI
import Foundation

struct Jogador: Identifiable {
    let id = UUID()
    let nome: String
    var tentativas: Int
    var vitorias: Int = 1
}
