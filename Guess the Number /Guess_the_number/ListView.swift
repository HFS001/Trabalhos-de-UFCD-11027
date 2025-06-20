import SwiftUI

struct ListView: View {
    @ObservedObject var jogadoresData: JogadoresData
    @State private var isGrid = false

    var topJogadores: [Jogador] {
        Array(jogadoresData.jogadores.sorted(by: { $0.tentativas < $1.tentativas }).prefix(10))
    }

    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        Group {
            if isGrid {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(topJogadores) { jogador in
                            NavigationLink(destination: JogadorDetailView(jogador: jogador)) {
                                VStack {
                                    Text("👤 \(jogador.nome)")
                                        .font(.headline)
                                    Text("🎯 \(jogador.tentativas) tentativas")
                                    Text("🏆 \(jogador.vitorias) vitórias")
                                        .font(.caption)
                                        .foregroundColor(.green)
                                }
                                .padding()
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                }
            } else {
                List {
                    ForEach(topJogadores) { jogador in
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
            }
        }
        .navigationTitle("Ranking")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Toggle("Grelha", isOn: $isGrid)
                    .toggleStyle(.switch)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
        }
    }
}
