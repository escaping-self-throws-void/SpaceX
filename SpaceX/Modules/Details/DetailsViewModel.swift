//
//  DetailsViewModel.swift
//  SpaceX
//
//  Created by Paul Matar on 02/11/2022.
//

import Foundation
import Combine

protocol DetailsViewModelProtocol {
    var update: PassthroughSubject<Bool, Never> { get }
    var rocketModel: RocketModel? { get }

    func mapModel()
}

final class DetailsViewModel: DetailsViewModelProtocol {
    private(set) var update = PassthroughSubject<Bool, Never>()
    private(set) var rocketModel: RocketModel?
    
    private let coordinator: MainCoordinator
    private let service: ApiServiceProtocol
    private let input: Any
    
    init(_ coordinator: MainCoordinator, service: ApiServiceProtocol, data: Any) {
        self.coordinator = coordinator
        self.service = service
        input = data
    }
    
    func mapModel() {
        guard let casted = input as? LaunchModel else { return }
        Task {
            do {
                let rocket = try await service.fetchRocket(id: casted.rocket)
                let image = try await ImageLoader.shared.downloadImage(from: rocket.images.first ?? "")
                rocketModel = RocketModel(date: casted.date,
                                        flightNumber: casted.flightNumber,
                                        upcoming: casted.upcoming,
                                        name: rocket.name,
                                        description: rocket.description,
                                        link: rocket.wikipedia,
                                        image: image)
                update.send(true)
            } catch {
                debugPrint(error)
            }
        }
    }
}
