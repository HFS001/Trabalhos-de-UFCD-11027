import SwiftUI

struct GameView: View {
    var nomeJogador: String
    var minRange: Int
    var maxRange: Int
    @ObservedObject var jogadoresData: JogadoresData

    @State private var numeroSecreto: Int
    @State private var palpiteDoUtilizador = ""
    @State private var mensagem: String
    @State private var numeroTentativas = 0

    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appState: AppState

    init(nomeJogador: String, jogadoresData: JogadoresData, minRange: Int, maxRange: Int) {
        self.nomeJogador = nomeJogador
        self.jogadoresData = jogadoresData
        self.minRange = minRange
        self.maxRange = maxRange
        _numeroSecreto = State(initialValue: Int.random(in: minRange...maxRange))
        _mensagem = State(initialValue: "Adivinha um número entre \(minRange) e \(maxRange)!")
    }

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
                numeroTentativas += 1
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

            NavigationLink(destination: ListView(jogadoresData: jogadoresData)) {
                Text("Lista de Jogadores")
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            HStack(spacing: 20) {
                Button("Voltar ao Menu") {
                    dismiss()
                }
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(10)

                Button("Nova Jogador") {
                    appState.restartID = UUID() 
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
            }

        }
        .padding()
        .navigationTitle("Guess The Number")
        .navigationBarTitleDisplayMode(.inline)
    }

    func verificarPalpite() {
        if let palpite = Int(palpiteDoUtilizador) {
            if palpite == numeroSecreto {
                mensagem = "🎉 Parabéns, \(nomeJogador)! Acertaste no número em \(numeroTentativas) tentativas!"
                jogadoresData.adicionarJogador(nome: nomeJogador, tentativas: numeroTentativas)
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
        numeroSecreto = Int.random(in: minRange...maxRange)
        palpiteDoUtilizador = ""
        mensagem = "Adivinha um número entre \(minRange) e \(maxRange)!"
        numeroTentativas = 0
    }
}
