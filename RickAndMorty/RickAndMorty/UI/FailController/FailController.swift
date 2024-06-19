//
//  FailController.swift
//  RickAndMorty
//
//  Created by Нахид Гаджалиев on 19.06.2024.
//

import UIKit

final class FailController: UIViewController {
    private enum Constants {
        static let updateNow = "UPDATE NOW"
    }
    private let updateButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }
    
    private func setupButton() {
        view.addSubview(updateButton)
        view.backgroundColor = .white
        updateButton.setTitle(Constants.updateNow, for: .normal)
        updateButton.setImage(UIImage(systemSymbol: .exclamationmark), for: .normal)
        updateButton.tintColor = .white
        updateButton.addTarget(self, action: #selector(onButtonTap), for: .touchUpInside)
        updateButton.backgroundColor = .systemBlue
        updateButton.layer.cornerRadius = 10
        updateButton.clipsToBounds = true
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            updateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            updateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            updateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            updateButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func onButtonTap() {
        print("В тз не указано, что данная кнопка должан делать")
    }
}

#Preview {
    FailController()
}
