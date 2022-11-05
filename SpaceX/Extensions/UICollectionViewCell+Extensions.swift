//
//  UICollectionViewCell+Extensions.swift
//  SpaceX
//
//  Created by Paul Matar on 02/11/2022.
//

import UIKit

extension UICollectionViewCell {
    func removeSubviews() {
        contentView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    static var reuseIdentifier: String {
        String(describing: Self.self)
    }
}
