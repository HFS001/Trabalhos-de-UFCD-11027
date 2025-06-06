import SwiftUI
import Foundation



class JogadoresData: ObservableObject {
    @Published var jogadores: [Jogador] = []

    func adicionarJogador(nome: String, tentativas: Int) {
        if let index = jogadores.firstIndex(where: { $0.nome == nome }) {
            jogadores[index].vitorias += 1
            jogadores[index].tentativas += tentativas
        } else {
            let novoJogador = Jogador(nome: nome, tentativas: tentativas)
            jogadores.append(novoJogador)
        }
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
