//
//  NetworkService.swift
//  SpaceX
//
//  Created by Paul Matar on 02/11/2022.
//

import Foundation

protocol NetworkService {
    func fetch<T: Codable>(with endpoint: String) async throws -> T
}

extension NetworkService {
    func fetch<T: Codable>(with endpoint: String) async throws -> T {
        guard let url = URL(string: endpoint) else {
            throw NetError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        
        guard let response = response as? HTTPURLResponse else {
            throw NetError.invalidResponse
        }
        
        guard (200..<300) ~= response.statusCode else {
            throw NetError.invalidStatusCode(response.statusCode)
        }
        
        guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else {
            throw NetError.unableToDecode
        }
        
        return decodedResponse
    }
}
