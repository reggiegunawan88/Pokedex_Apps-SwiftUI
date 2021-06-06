//
//  PokemonViewModel.swift
//  Pokedex-Apps-iOS
//
//  Created by TI Digital on 06/06/21.
//

import SwiftUI

class PokemonViewModel : ObservableObject {
    @Published var pokemon = [PokemonData]()
    let apiURL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init() {
        fetchPokemonData()
        print("data:", pokemon)
    }
    
    func fetchPokemonData(){
        guard let url = URL(string: apiURL) else { return }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let cleanData = data?.parseData(removeString: "null,") else{ return }
            print("parsed data: " ,cleanData)
            do{
                let decodedData = try JSONDecoder().decode([PokemonData].self, from: cleanData)
                self.pokemon = decodedData
            } catch{
                print("error msg:",error)
            }
        }
        task.resume()
    }
}


extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString? .replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        
        return data
        }
}
