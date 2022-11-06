//
//  Launch.swift
//  SpaceX
//
//  Created by Paul Matar on 05/11/2022.
//

import Foundation

struct Container: Decodable {
    let docs: [Launch]
    let limit: Int
}

struct Launch: Decodable {
    let rocket, name, dateUTC: String
    let flightNumber: Int
    let upcoming: Bool
    
    enum CodingKeys: String, CodingKey {
        case rocket, name, upcoming
        case dateUTC = "date_utc"
        case flightNumber = "flight_number"
    }
}
