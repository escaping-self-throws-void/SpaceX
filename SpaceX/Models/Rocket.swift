//
//  Rocket.swift
//  SpaceX
//
//  Created by Paul Matar on 06/11/2022.
//

import Foundation

struct Rocket: Decodable {
    let name, description: String
    let images: [String]
    let wikipedia: String
    
    enum CodingKeys: String, CodingKey {
        case name, description
        case wikipedia
        case images = "flickr_images"
    }
}
