//
//  PokemonCard.swift
//  Pokedex-Apps-iOS
//
//  Created by TI Digital on 06/06/21.
//

import SwiftUI

struct PokemonCard: View {
    let pokemonData : PokemonData
    var body: some View {
        ZStack{
            VStack(alignment: .leading) {
                Text(pokemonData.name)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top,10)
                    .padding(.leading)
                
                HStack{
                    Text(pokemonData.type)
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        .frame(width: 100, height: 25)
                    Image(pokemonData.imageURL)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                        .padding([.bottom, .trailing], 5)
                }
            }
        }
        .background(Color.green)
        .cornerRadius(12)
        .shadow(color: .green, radius: 8, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
        
    }
}

struct PokemonCard_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCard(pokemonData: MOCK_POKEMONDATA[0])
    }
}
