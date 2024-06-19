//
//  SceneDelegate.swift
//  RickAndMorty
//
//  Created by Нахид Гаджалиев on 18.06.2024.
//

import UIKit
import FirebaseRemoteConfig

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var remoteConfig = RemoteConfig.remoteConfig()
    var window: UIWindow?
    var needForceUpdate: Bool = true
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        fetchValues { [weak self] in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                let window = UIWindow(windowScene: windowScene)
                window.rootViewController = self.chooseController(view: self.needForceUpdate)
                window.makeKeyAndVisible()
                self.window = window
            }
        }
    }
    
    func fetchValues(completion: @escaping () -> Void) {
        let defaults: [String: NSObject] = [
            "needForceUpdate": false as NSObject
        ]
        
        remoteConfig.setDefaults(defaults)
        
        let setting = RemoteConfigSettings()
        setting.minimumFetchInterval = 0
        remoteConfig.configSettings = setting
        
        self.remoteConfig.fetch(withExpirationDuration: 0) { status, error in
            if status == .success,
               error == nil {
                self.remoteConfig.activate { _, error in
                    guard error == nil else { return }
                    
                    self.needForceUpdate = self.remoteConfig.configValue(forKey: "needForceUpdate").boolValue
                    completion()
                }
            }
        }
    }
    
    func chooseController(view: Bool) -> UIViewController {
        if view {
            return FailController()
        } else {
            return TabBarController()
        }
    }
}

