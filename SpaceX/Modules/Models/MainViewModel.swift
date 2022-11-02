//
//  MainViewModel.swift
//  SpaceX
//
//  Created by Paul Matar on 02/11/2022.
//

import Foundation

protocol MainViewModelProtocol {

}

final class MainViewModel: MainViewModelProtocol {
    
    private let coordinator: MainCoordinator
    
    init(_ coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    

}
