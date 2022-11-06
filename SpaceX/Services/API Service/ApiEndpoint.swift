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

    var body: [String : Any]? {
        switch self {
        case .successful:
            return getQueryBody()
        default:
            return nil
        }
    }
    
    private func getQueryBody() -> [String : Any] {
        let today = Date()
        let calendar = Calendar.current
        var component = DateComponents()
        component.year = -3
        let threeYearsAgo = calendar.date(byAdding: component, to: Date())
        
        let date = ["$gte": threeYearsAgo?.toUTC, "$lte": today.toUTC]
        let query: [String : Any] = ["date_utc": date, "success": true]
        let sort = ["date_utc": "-1"]
        let options: [String : Any] = ["sort": sort, "limit": 103]
        
        return ["query": query, "options": options]
    }
}
