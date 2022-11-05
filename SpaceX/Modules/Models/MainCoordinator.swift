//
//  MainCoordinator.swift
//  SpaceX
//
//  Created by Paul Matar on 02/11/2022.
//

import UIKit

final class MainCoordinator: BaseCoordinator {
        
    override func start() {
        let viewModel = MainViewModel(self, service: ApiService())
        let viewController = MainController(viewModel)
        navigationController.setViewControllers([viewController], animated: false)
    }

}
