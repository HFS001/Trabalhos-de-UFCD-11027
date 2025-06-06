import SwiftUI

struct WelcomeView: View {
    @State private var nomeJogador: String = ""
    @State private var minRange: String = "1"
    @State private var maxRange: String = "100"
    @EnvironmentObject var jogadoresData: JogadoresData

    var body: some View {
        VStack(spacing: 20) {
            Text("🎉 Bem-vindo ao Jogo Guess the Number!")
                .font(.title)
                .multilineTextAlignment(.center)

            TextField("Escreve o teu nome", text: $nomeJogador)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Text("Escolhe o intervalo:")
                .font(.headline)

            HStack {
                TextField("Mínimo", text: $minRange)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("até")
                TextField("Máximo", text: $maxRange)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding()

            if let min = Int(minRange), let max = Int(maxRange), min < max, !nomeJogador.isEmpty {
                NavigationLink(destination:
                    GameView(
                        nomeJogador: nomeJogador,
                        jogadoresData: jogadoresData,
                        minRange: min,
                        maxRange: max
                    )
                ) {
                    Text("Começar o Jogo")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            } else {
                Text("⚠️ Introduz nome e intervalo válido").foregroundColor(.red)
            }
        }
        .padding()
        .navigationTitle("Menu")
    }
}
