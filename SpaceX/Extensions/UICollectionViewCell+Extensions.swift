//
//  UICollectionViewCell+Extensions.swift
//  SpaceX
//
//  Created by Paul Matar on 02/11/2022.
//

import UIKit

extension UITableViewCell {
    func removeSubviews() {
        contentView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
