//
//  ApiService.swift
//  SpaceX
//
//  Created by Paul Matar on 05/11/2022.
//

import Foundation

protocol ApiServiceProtocol {
    func fetchLaunches() async throws -> [Launch]
}

struct ApiService: HTTPClient, ApiServiceProtocol {
    func fetchLaunches() async throws -> [Launch] {
        var result = [Launch]()
        async let upcoming: [Launch] = sendRequest(endpoint: ApiEndpoint.upcoming)
        async let successful: Container = sendRequest(endpoint: ApiEndpoint.successful)
        
        result += try await upcoming
        result += try await successful.docs

        return result
    }
}
