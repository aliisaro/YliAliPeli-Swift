//
//  YliAliPeli.swift
//  YliAliPeli
//
//  Created by Aliisa Rokala on 31.1.2025.
//
import SwiftUI

enum PeliTulos {
    case Ali, Yli, Osuma
}
class YliAli: ObservableObject {
    let secret: Int
    let low: Int
    let high: Int
    
    @Published private(set) var guesses:
    Array<Int> = []
        init(low: Int, high: Int) {
        self.low = low
        self.high = high
        self.secret =
    (low...high).randomElement() ?? low
}
    
func arvaa(arvaus: Int) ->
PeliTulos {
    guesses.append(arvaus)
    if arvaus < secret {
        return PeliTulos.Ali
    } else if arvaus > secret {
        return PeliTulos.Yli
    } else {
        return PeliTulos.Osuma
    }
}
    
    func tries() -> Int {
        return guesses.count
    }
}
