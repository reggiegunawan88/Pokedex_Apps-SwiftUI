//
//  PokemonDetails.swift
//  Pokedex-Apps-iOS
//
//  Created by Reggie Gunawan on 06/06/21.
//

import SwiftUI
import Kingfisher

struct PokemonDetails: View {
    let pokemonData : PokemonData
    let pokemonViewModel: PokemonViewModel
    let backgroundColor: Color
    
    init(pokemonData: PokemonData, pokemonViewModel: PokemonViewModel) {
        self.pokemonData = pokemonData
        self.pokemonViewModel = pokemonViewModel
        self.backgroundColor = Color(pokemonViewModel.detectBackgroundColor(forType: pokemonData.type))
    }
    
    var body: some View {
        ZStack{
            backgroundColor
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                KFImage(URL(string: pokemonData.imageUrl))
                    .resizable()
                    .frame(width: 200, height: 200)
                Text(pokemonData.name.uppercased())
                    .font(.title)
                    .foregroundColor(.black)
                Text(pokemonData.type.uppercased())
                    .font(.title2).bold()
                    .foregroundColor(.white)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(backgroundColor).opacity(0.5)
                    )
                    
                    .frame(width: 200, height: 25)
            }
        }
    }
}

//struct PokemonDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonDetails(pokemonData: MOCK_POKEMONDATA[0])
//    }
//}
