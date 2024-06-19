//
//  CharacterDetailController.swift
//  RickAndMorty
//
//  Created by Нахид Гаджалиев on 19.06.2024.
//

import UIKit

final class CharacterDetailController: UIViewController {
    private enum Constants {
        static let status = "Status"
        static let gender = "Gender"
        static let type = "Type"
        static let species = "Species"
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let statusView = CharacterInfoView()
    private let genderView = CharacterInfoView()
    private let typeView = CharacterInfoView()
    private let speciesView = CharacterInfoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    func configure(character: Result) {
        title = character.name
        
        if let url = URL(string: character.image) {
            imageView.load(url: url)
        }
        
        statusView.configure(
            with: Constants.status,
            value: character.status.rawValue,
            color: .blue
        )
        
        genderView.configure(
            with: Constants.gender,
            value: character.gender.rawValue,
            color: .red
        )
        
        typeView.configure(
            with: Constants.type,
            value: character.type,
            color: .purple
        )
        
        speciesView.configure(
            with: Constants.species,
            value: character.species.rawValue,
            color: .green
        )
    }
    
    private func setupLayout() {
        view.addSubview(imageView)
        view.addSubview(statusView)
        view.addSubview(genderView)
        view.addSubview(typeView)
        view.addSubview(speciesView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 350),
            
            statusView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 80),
            statusView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            statusView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),
            
            genderView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 80),
            genderView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
            genderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            typeView.topAnchor.constraint(equalTo: statusView.bottomAnchor, constant: 100),
            typeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            typeView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),
            
            speciesView.topAnchor.constraint(equalTo: genderView.bottomAnchor, constant: 100),
            speciesView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
            speciesView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

#Preview {
    TabBarController()
}
