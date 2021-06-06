//
//  PokemonData.swift
//  Pokedex-Apps-iOS
//
//  Created by TI Digital on 06/06/21.
//

import Foundation

struct PokemonData : Decodable, Identifiable {
    let id : Int
    let name: String
    let imageURL: String
    let type: String
}

let MOCK_POKEMONDATA: [PokemonData] = [
    .init(id: 1, name: "Bulbasaur", imageURL: "goku-hello", type: "poison"),
    .init(id: 2, name: "Venusaur", imageURL: "1", type: "water"),
    .init(id: 3, name: "Ivysaur", imageURL: "1", type: "fire")
]
