//
//  MainViewModel.swift
//  SpaceX
//
//  Created by Paul Matar on 02/11/2022.
//

import Foundation
import Combine

protocol MainViewModelProtocol {
    var launches: [LaunchModel] { get }
    var refresh: PassthroughSubject<Bool, Never> { get }
    
    func getLaunches()
    func goToDetails(id: String)
}

final class MainViewModel: MainViewModelProtocol {
    var refresh = PassthroughSubject<Bool, Never>()

    private let coordinator: MainCoordinator
    private var service: ApiServiceProtocol
    
    private(set) var launches = [LaunchModel]()
    
    init(_ coordinator: MainCoordinator, service: ApiServiceProtocol) {
        self.coordinator = coordinator
        self.service = service
    }
    
    func getLaunches() {
        Task {
            do {
                let fetchedData = try await service.fetchLaunches()
                mapModels(fetchedData)
                refresh.send(true)
            } catch {
                debugPrint(error)
            }
        }
    }
    
    func goToDetails(id: String) {
        coordinator.openDetailsScreen(id: id)
    }
    
    private func mapModels(_ data: [Launch]) {
        launches = data.map { launch in
            LaunchModel(rocket: launch.rocket,
                        name: launch.name,
                        date: launch.dateUTC.getDate.toString,
                        flightNumber: String(launch.flightNumber),
                        upcoming: launch.upcoming)
        }
    }
}
