//
//  UIView+Extensions.swift
//  SpaceX
//
//  Created by Paul Matar on 02/11/2022.
//

import UIKit

extension UIView {
    var cornerRadius: CGFloat {
        get {
            layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
