import SwiftUI

struct ListView: View {
    @ObservedObject var jogadoresData: JogadoresData

    var body: some View {
        List {
            ForEach(jogadoresData.jogadores.sorted(by: { $0.tentativas < $1.tentativas })) { jogador in
                NavigationLink(destination: JogadorDetailView(jogador: jogador)) {
                    HStack {
                        Text("👤 \(jogador.nome)")
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("🎯 \(jogador.tentativas) tentativas")
                            Text("🏆 \(jogador.vitorias) vitórias")
                                .font(.caption)
                                .foregroundColor(.green)
                        }
                    }
                }
            }
            .onDelete { indexSet in
                jogadoresData.jogadores.remove(atOffsets: indexSet)
            }
        }
        .navigationTitle("Jogadores")
        .toolbar {
            EditButton()
        }
    }
}
