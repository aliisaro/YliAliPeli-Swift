import SwiftUI

struct ContentView: View {
    
    @StateObject private var game = YliAli(low: 1, high: 100)
    @State private var arvaus: String = ""
    @State private var tulos: String = ""
    
    var body: some View {
        VStack {
            // Arvaukset
            Text("Arvaukset: \(game.guesses.map { String($0) }.joined(separator: ", "))")
                .foregroundColor(.pink)
                .padding()
            
            // Yritysten määrä
            if game.tries() > 0 {
                Text("Yritksiä: \(game.tries())")
                    .padding()
                    .foregroundColor(.blue)
            }
            
            // Tulos viesti
            Text(tulos)
                .foregroundColor(.purple)
                .padding()
                          
            // Tekstikenttä arvaukselle
            TextField("Arvaa luku", text: $arvaus)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // Arvaa nappi
            Button("Arvaa") {
                if let guess = Int(arvaus) {
                    let result = game.arvaa(arvaus: guess)
                    
                    // Update the tulos state based on the result
                    switch result {
                        case .Ali:
                            tulos = "Liian matala"
                        case .Yli:
                            tulos = "Liian korkea"
                        case .Osuma:
                            tulos = "Oikein!"
                    }
                    arvaus = ""
                } else {
                    tulos = "Anna kelvollinen numero"
                }
            }
            .foregroundColor(.black)
        
        }
    .padding()
    }
}

#Preview {
    ContentView()
}
