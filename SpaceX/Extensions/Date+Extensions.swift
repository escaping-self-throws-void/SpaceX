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
    
    var toUTC: String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return formatter.string(from: self)
    }
}
