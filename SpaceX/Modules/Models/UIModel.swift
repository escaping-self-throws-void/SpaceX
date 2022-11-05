//
//  UIModel.swift
//  SpaceX
//
//  Created by Paul Matar on 05/11/2022.
//

import Foundation

struct LaunchModel: Hashable {
    let rocket, name, date, flightNumber: String
    let upcoming: Bool
}
