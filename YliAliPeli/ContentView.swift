import SwiftUI

struct ContentView: View {
    
    @StateObject private var game = YliAli(low: 1, high: 100)
    @State private var arvaukset: [Int] = []
    @State private var arvaus: String = ""
    @State private var tulos: String = ""
    
    var body: some View {
        VStack {
            // Arvaukset
            Text("Arvaukset: \(arvaukset.map { String($0) }.joined(separator: ", "))")
                .foregroundColor(.pink)
                .padding()
            
            // Tulos viesti
            Text(tulos)
                .foregroundColor(.blue)
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
                    arvaukset.append(guess)
                    
                    switch result {
                        case .Ali:
                            tulos = "Liian matala"
                        case .Yli:
                            tulos = "Liian korkea"
                        case .Osuma:
                            tulos = "Oikein!"
                    }
                    arvaus = "" // Resetoidaan tesktikenttä
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
