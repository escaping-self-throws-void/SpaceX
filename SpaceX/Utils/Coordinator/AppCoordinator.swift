//
//  BaseCoordinator.swift
//  SpaceX
//
//  Created by Paul Matar on 02/11/2022.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
     
    private let window: UIWindow
        
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        let coordinator = MainCoordinator()
        coordinator.navigationController = navigationController
        start(coordinator)
    }
}
