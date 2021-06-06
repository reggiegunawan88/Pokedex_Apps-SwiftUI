//
//  PokedexList.swift
//  Pokedex-Apps-iOS
//
//  Created by TI Digital on 06/06/21.
//

import SwiftUI

struct PokedexList: View {
    // apply grid for pokemon list
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: gridItems, spacing:15) {
                    ForEach(0..<150) { _ in
                        PokemonCard()
                    }
                }
            }
            .navigationTitle("Pokedex")
        }
    }
}

struct PokedexList_Previews: PreviewProvider {
    static var previews: some View {
        PokedexList()
    }
}
