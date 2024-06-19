//
//  CharactersController.swift
//  RickAndMorty
//
//  Created by Нахид Гаджалиев on 19.06.2024.
//

import UIKit

final class CharactersController: UIViewController {
    private enum Constants {
        static let characters = "Characters"
    }
    
    private let viewModel = CharactersViewModel()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.characters
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        label.sizeToFit()
        return label
    }()
    
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationTitle()
        setupCollectionView()
        setupBindings()
        viewModel.fetchCharacters()
    }
    
    private func setupNavigationTitle() {
        let leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(
            width: (view.frame.size.width / 2) - 25,
            height: (view.frame.size.height / 2) + 60
        )
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 15
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 10)
    
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: CharacterCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupBindings() {
        viewModel.onUpdate = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
}

// MARK: - UICollectionViewDataSource
extension CharactersController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CharacterCell.identifier,
            for: indexPath
        ) as? CharacterCell else {
            return UICollectionViewCell()
        }
        
        let character = viewModel.characters[indexPath.row]
        cell.configure(with: character)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CharactersController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(
            width: (view.frame.size.width / 2) - 17,
            height: (view.frame.size.width / 2) + 60
        )
    }
}

extension CharactersController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = viewModel.characters[indexPath.row]
        let detailVC = CharacterDetailController()
        detailVC.configure(character: character)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

#Preview {
    UINavigationController(rootViewController: TabBarController())
}
