//
//  PokedexList.swift
//  Pokedex-Apps-iOS
//
//  Created by Reggie Gunawan on 06/06/21.
//

import SwiftUI

struct PokedexList: View {
    // apply grid for pokemon list
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    @ObservedObject var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: gridItems, spacing:15) {
                    ForEach(viewModel.pokemon) { pokemon in
                        NavigationLink(destination: PokemonDetails(pokemonData: pokemon)){
                            EmptyView()
                            PokemonCard(pokemonData: pokemon, pokemonViewModel: viewModel)
                        }
                    }
                }
                .padding(.top, 15)
            }
            .navigationTitle("Pokedex")
        }
        .accentColor(.white)
    }
}

//struct PokedexList_Previews: PreviewProvider {
//    static var previews: some View {
//        PokedexList()
//    }
//}
