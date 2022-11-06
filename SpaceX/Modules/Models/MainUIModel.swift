//
//  UIModel.swift
//  SpaceX
//
//  Created by Paul Matar on 05/11/2022.
//

import Foundation

struct LaunchModel: Hashable {
    let id, rocket, name, date, flightNumber: String
    let upcoming: Bool
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: LaunchModel, rhs: LaunchModel) -> Bool {
        lhs.id == rhs.id
    }
}
