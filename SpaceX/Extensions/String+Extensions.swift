//
//  String+Extensions.swift
//  SpaceX
//
//  Created by Paul Matar on 05/11/2022.
//

import Foundation

extension String {
    var getDate: Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: self)
        return date ?? Date()
    }
}
