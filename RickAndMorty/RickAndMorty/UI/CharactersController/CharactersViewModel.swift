//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Нахид Гаджалиев on 19.06.2024.
//

import Foundation

final class CharactersViewModel {
    private let apiManager = APIManager.shared
    var characters: [Result] = []
    var onUpdate: (() -> Void)?
    
    func fetchCharacters() {
        apiManager.getCharacter { [weak self] person in
            self?.characters = person.results
            self?.onUpdate?()
        }
    }
}
