import SwiftUI
import Foundation

struct Jogador: Identifiable {
    let id = UUID()
    let nome: String
    var tentativas: Int
    var vitorias: Int = 1
}
