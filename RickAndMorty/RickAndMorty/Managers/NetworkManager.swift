//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Нахид Гаджалиев on 18.06.2024.
//

import Foundation

final class APIManager {
    static let shared = APIManager()
    
    private let baseURL = "https://rickandmortyapi.com/api"
    private let characterEndPoint = "/character"
    
    func getCharacter(complition: @escaping(Person) -> Void) {
        guard let url = URL(string: baseURL + characterEndPoint) else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data else { return }
            
            if let person = try? JSONDecoder().decode(Person.self, from: data) {
                complition(person)
            }
        }
        .resume()
    }
}
