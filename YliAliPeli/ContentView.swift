import SwiftUI

struct ContentView: View {
    
    @StateObject private var game = YliAli(low: 1, high: 100)
    @State private var arvaus: Int = 1
    @State private var tulos: String = ""
    @State private var numero: Double = 0
    
    var body: some View {
        ZStack {
            // Tausta
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]), startPoint: .top, endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            // Main content
            HStack {
                VStack {
                    // Otsikko
                    Text("Yli ali peli")
                        .font(.largeTitle.weight(.bold))
                        .foregroundColor(.pink.opacity(0.5))
                        .padding()
                    
                    // Arvaukset
                    Text("Arvaukset: \(game.guesses.map { String($0) }.joined(separator: ", "))")
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.bottom)
                    
                    HStack {
                        // Yritysten määrä
                        if game.tries() > 0 {
                            Text("Yrityksiä: \(game.tries())")
                                .padding()
                        }
                        // Tulos viesti
                        Text(tulos)
                            .padding()
                    }

                    // Liukusäädin numeroille
                    Slider(value: Binding(
                        get: { Double(arvaus) },
                        set: { arvaus = Int($0) }
                    ), in: 1...100, step: 1)
                    
                    Text("Valittu luku: \(arvaus)")
                        .padding()
                    
                    // Arvaa nappi
                    Button("Arvaa") {
                        let result = game.arvaa(arvaus: arvaus)
                        
                        switch result {
                        case .Ali:
                            tulos = "Liian matala"
                        case .Yli:
                            tulos = "Liian korkea"
                        case .Osuma:
                            tulos = "Oikein!"
                        }
                        
                    }
                    .buttonStyle(.borderedProminent)
                
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}

