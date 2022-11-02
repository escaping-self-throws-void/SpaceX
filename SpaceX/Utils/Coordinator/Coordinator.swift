//
//  Coordinator.swift
//  SpaceX
//
//  Created by Paul Matar on 02/11/2022.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var parentCoordinator: Coordinator? { get set }
    
    func start()
    func start(_ coordinator: Coordinator)
    func didFinish(_ coordinator: Coordinator)
}

class BaseCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var navigationController = UINavigationController()
    
    func start() {
        fatalError("Start method must be implemented")
    }
    
    func start(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.start()
    }
    
    func didFinish(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
    
    
}
