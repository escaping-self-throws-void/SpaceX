//
//  ApiEndpoints.swift
//  SpaceX
//
//  Created by Paul Matar on 05/11/2022.
//

import Foundation

enum ApiEndpoint {
    case upcoming
    case successful
    case rocketDetail(id: String)
}

extension ApiEndpoint: Endpoint {
    var path: String {
        switch self {
        case .upcoming:
            return "/launches/upcoming"
        case .successful:
            return "/launches/query"
        case .rocketDetail(let id):
            return "/rockets/\(id)"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .upcoming, .rocketDetail:
            return .GET
        case .successful:
            return .POST
        }
    }
    
    var header: [String : String]? {
        return nil
    }
    
    var body: [String : String]? {
        switch self {
        case .successful:
            return [:]
        default:
            return nil
        }
    }
}
