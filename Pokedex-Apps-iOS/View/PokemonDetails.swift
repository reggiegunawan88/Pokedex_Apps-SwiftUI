//
//  PokemonDetails.swift
//  Pokedex-Apps-iOS
//
//  Created by Reggie Gunawan on 06/06/21.
//

import SwiftUI

struct PokemonDetails: View {
    let pokemonData : PokemonData
    var body: some View {
        Text(pokemonData.name.capitalized)
    }
}

//struct PokemonDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonDetails()
//    }
//}
