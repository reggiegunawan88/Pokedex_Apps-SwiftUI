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
    let weight: Float
    let height: Float
    let description: String
    let attack: Float
    let defense: Float
}

// for mocking data only
//let MOCK_POKEMONDATA: [PokemonData] = [
//    .init(id: 10, name: "Bulbasaur", imageUrl: "goku-hello" ,type: "poison", weight: 15, height: 80, description: "bulbasaur is in the house", attack: 30, defense: 18),
//    .init(id: 2, name: "Venusaur", type: "water"),
//    .init(id: 3, name: "Ivysaur", type: "fire")
//]
