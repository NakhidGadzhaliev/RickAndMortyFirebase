//
//  Image+SystemSymbol.swift
//  RickAndMorty
//
//  Created by Нахид Гаджалиев on 18.06.2024.
//

import UIKit

extension UIImage {
    convenience init?(systemSymbol: SFSymbolIdentifier) {
        self.init(systemName: systemSymbol.rawValue)
    }
}

enum SFSymbolIdentifier: String {
    case bell = "bell"
    case person = "person"
    case globe = "globe"
    case tv = "tv"
    case gear = "gear"
    case exclamationmark = "exclamationmark.triangle"
}
