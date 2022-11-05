//
//  Date+Extensions.swift
//  SpaceX
//
//  Created by Paul Matar on 05/11/2022.
//

import Foundation

extension Date {
    var toString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM yyyy, HH:mm z"
        return formatter.string(from: self)
    }
}
