//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Нахид Гаджалиев on 18.06.2024.
//

//final class NetworkManager {
//    private let baseURL = "https://rickandmortyapi.com/api"
//    private let characterEndPoint = "/character"
//    private let decoder = JSONDecoder()
//    
//    func fetchCharacters() -> AnyPublisher<Character, Error> {
//        guard let url = URL(string: baseURL + characterEndPoint) else {
//            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
//        }
//        
//        return URLSession.shared.dataTaskPublisher(for: url)
//            .map(\.data)
//            .decode(type: Character.self, decoder: decoder)
//            .receive(on: DispatchQueue.main)
//            .eraseToAnyPublisher()
//    }
//}

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
