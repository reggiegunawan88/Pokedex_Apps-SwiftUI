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
//    let pokemonViewModel: PokemonViewModel
//    let backgroundColor: Color
    
//    init(pokemonData: PokemonData, pokemonViewModel: PokemonViewModel) {
//        self.pokemonData = pokemonData
//        self.pokemonViewModel = pokemonViewModel
//        self.backgroundColor = Color(pokemonViewModel.detectBackgroundColor(forType: pokemonData.type))
//    }
    
    var body: some View {
        ZStack(alignment: .top){
            Color(.green).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                Image("bulbasaur")
//                KFImage(URL(string: pokemonData.imageUrl))
                    .resizable()
                    .offset(y: 25)
                    .frame(width: 150, height: 150)
                    .padding(.top, 50)
                    .zIndex(1)
                VStack(alignment: .leading){
                    
                    /* Name, types, and desc section */
                    VStack(spacing: 20){
                        Text(pokemonData.name.capitalized)
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                        HStack{
                            // applies hstack if multiple types exist
                            Text(pokemonData.type.uppercased())
                                .font(.title2).bold()
                                .foregroundColor(.black)
                                .padding(.horizontal, 25)
                                .padding(.vertical, 10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color(.green)).opacity(0.3)
                                )
                                .frame(width: 200, height: 25)
                                .shadow(color: Color(.green), radius: 5)
                        }
                        Text("Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun’s rays, the seed grows progressively larger.")
                            .foregroundColor(Color(.gray)).bold()
                            .padding()
                            .padding(.top,20)
                    }
                    .padding(.top, 50)
                    
                    /* Stats Section */
                    VStack(alignment: .leading){
                        HStack{
                            Text("STATS")
                                .font(.headline)
                                .padding()
                            
                        }
                        VStack(spacing: 15){
                            ForEach (0..<5) { _ in
                                StatList(statusName: "HP", value: 3/10)
                            }
                        }
                        
                    }
                    .padding()
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                .cornerRadius(50.0, corners: [.topLeft, .topRight])
                    .edgesIgnoringSafeArea(.bottom)
                    
            }
        }
    }
}

// status list view
struct StatList : View {
    @State var statusName : String
    @State var value : Float
    var body: some View {
        HStack {
            Text(statusName.uppercased())
                .font(.subheadline)
            .padding(.horizontal, 20)
         Text(String(value))
            Meterbar(value: $value).frame(height: 10)
                .padding(.trailing, 15)
        }
        .padding(.horizontal, 10)
    }
}

// status meterbar view
struct Meterbar : View {
    @Binding var value : Float
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading){
                // meterbar placeholder
                Rectangle().frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemGray2))
                
                // meterbar fill
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color.green)
                    .animation(.linear)
                    .cornerRadius(45, corners: .allCorners)
            }
            .cornerRadius(45.0, corners: .allCorners)
        }
    }
}


// for top border corner radius
struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct PokemonDetails_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetails(pokemonData: MOCK_POKEMONDATA[0])
    }
}
