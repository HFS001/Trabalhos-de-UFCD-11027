import SwiftUI

struct ListView: View {
    @ObservedObject var jogadoresData: JogadoresData

    var body: some View {
        let topJogadores = jogadoresData.jogadores
            .sorted { $0.tentativas < $1.tentativas }
            .prefix(10)

        List(topJogadores) { jogador in
            HStack {
                Text("👤 \(jogador.nome)")
                Spacer()
                Text("🎯 \(jogador.tentativas) tentativas")
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("Top 10 Jogadores")
    }
}
