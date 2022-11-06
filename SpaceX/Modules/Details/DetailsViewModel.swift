//
//  DetailsViewModel.swift
//  SpaceX
//
//  Created by Paul Matar on 02/11/2022.
//

import Foundation

protocol DetailsViewModelProtocol {

}

final class DetailsViewModel: DetailsViewModelProtocol {
    
    private let coordinator: MainCoordinator
    private var service: ApiServiceProtocol
        
    init(_ coordinator: MainCoordinator, service: ApiServiceProtocol) {
        self.coordinator = coordinator
        self.service = service
    }
}
