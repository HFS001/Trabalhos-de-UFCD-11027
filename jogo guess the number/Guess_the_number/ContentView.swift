import SwiftUI
import Foundation

struct Jogador: Identifiable {
    let id = UUID()
    let nome: String
    let tentativas: Int
}

class JogadoresData: ObservableObject {
    @Published var jogadores: [Jogador] = []

    func adicionarJogador(nome: String, tentativas: Int) {
        let novoJogador = Jogador(nome: nome, tentativas: tentativas)
        jogadores.append(novoJogador)
    }
}

struct ContentView: View {
    @EnvironmentObject var jogadoresData: JogadoresData
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationStack {
            WelcomeView()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AppState())
        .environmentObject(JogadoresData())
}
