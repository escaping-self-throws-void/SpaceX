//
//  MainViewModel.swift
//  SpaceX
//
//  Created by Paul Matar on 02/11/2022.
//

import Foundation
import Combine

protocol MainViewModelProtocol {
    var refresh: PassthroughSubject<Bool, Never> { get }
    var launches: [LaunchModel] { get }
    
    func getLaunches()
    func goToDetails(_ data: Any)
}

final class MainViewModel: MainViewModelProtocol {
    private(set) var refresh = PassthroughSubject<Bool, Never>()
    private(set) var launches = [LaunchModel]()
    
    private let coordinator: MainCoordinator
    private let service: ApiServiceProtocol
    
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
    
    func goToDetails(_ data: Any) {
        coordinator.openDetailsScreen(data)
    }
    
    private func mapModels(_ data: [Launch]) {
        launches = data.map { launch in
            LaunchModel(id: launch.id,
                        rocket: launch.rocket,
                        name: launch.name,
                        date: launch.dateUTC.getDate.toString,
                        flightNumber: String(launch.flightNumber),
                        upcoming: launch.upcoming)
        }
    }
}
