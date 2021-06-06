//
//  PokemonData.swift
//  Pokedex-Apps-iOS
//
//  Created by Reggie Gunawan on 06/06/21.
//

import Foundation

struct PokemonData : Decodable, Identifiable {
    let id : Int
    let name: String
    let imageUrl: String
    let type: String
}

// for mocking data only
let MOCK_POKEMONDATA: [PokemonData] = [
    .init(id: 1, name: "Bulbasaur", imageUrl: "goku-hello" ,type: "poison"),
//    .init(id: 2, name: "Venusaur", type: "water"),
//    .init(id: 3, name: "Ivysaur", type: "fire")
]
