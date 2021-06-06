//
//  PokemonCard.swift
//  Pokedex-Apps-iOS
//
//  Created by Reggie Gunawan on 06/06/21.
//

import SwiftUI
import Kingfisher

struct PokemonCard: View {
    let pokemonData : PokemonData
    let pokemonViewModel: PokemonViewModel
    let backgroundColor : Color
    
    init(pokemonData: PokemonData, pokemonViewModel: PokemonViewModel){
        self.pokemonData = pokemonData
        self.pokemonViewModel = pokemonViewModel
        self.backgroundColor = Color(pokemonViewModel.detectBackgroundColor(forType: pokemonData.type))
    }
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading) {
                HStack{
                    Text(pokemonData.name.capitalized)
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .padding(.top,10)
                        .padding(.leading)
                }
                
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
                    KFImage(URL(string: pokemonData.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                        .padding([.bottom, .trailing], 5)
                }
            }
        }
        .background(backgroundColor)
        .cornerRadius(12)
        .shadow(color: backgroundColor, radius: 8, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
        
    }
}

//struct PokemonCard_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonCard(pokemonData: MOCK_POKEMONDATA[0])
//    }
//}
