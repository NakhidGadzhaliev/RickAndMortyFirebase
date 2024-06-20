//
//  TabBarController.swift
//  RickAndMorty
//
//  Created by Нахид Гаджалиев on 19.06.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    private enum Constants {
        static let characters = "Characters"
        static let locations = "Locations"
        static let episodes = "Episodes"
        static let settings = "Settings"
    }
    
    private let charactersVC = CharactersController()
    private let locationsVC = LocationsViewController()
    private let episodesVC = EpisodesViewController()
    private let settingsVC = SettingsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        charactersVC.tabBarItem = UITabBarItem(
            title: Constants.characters,
            image: UIImage(systemSymbol: .person),
            tag: 0
        )
        
        locationsVC.tabBarItem = UITabBarItem(
            title: Constants.locations,
            image: UIImage(systemSymbol: .globe),
            tag: 1
        )
        
        episodesVC.tabBarItem = UITabBarItem(
            title: Constants.episodes,
            image: UIImage(systemSymbol: .tv),
            tag: 2
        )
        
        settingsVC.tabBarItem = UITabBarItem(
            title: Constants.settings,
            image: UIImage(systemSymbol: .gear),
            tag: 3
        )
        
        viewControllers = [
            UINavigationController(rootViewController: charactersVC),
            UINavigationController(rootViewController: locationsVC),
            UINavigationController(rootViewController: episodesVC),
            UINavigationController(rootViewController: settingsVC)
        ]
        
        didMove(toParent: self)
    }
}

final class LocationsViewController: UIViewController {
    private enum Constants {
        static let locations = "Locations"
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.locations
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        label.sizeToFit()
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
}

final class EpisodesViewController: UIViewController {
    private enum Constants {
        static let episodes = "Episodes"
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.episodes
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        label.sizeToFit()
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
}

final class SettingsViewController: UIViewController {
    private enum Constants {
        static let settings = "Settings"
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.settings
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        label.sizeToFit()
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
}

#Preview {
    TabBarController()
}
