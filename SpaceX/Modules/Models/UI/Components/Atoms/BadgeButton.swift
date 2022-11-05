//
//  Badge.swift
//  SpaceX
//
//  Created by Paul Matar on 02/11/2022.
//

import UIKit

protocol BadgeContainer: AnyObject {
    func showBadge(text: String?)
}

extension BadgeContainer where Self: UIView {
    
    func showBadge(text: String?) {
        let badgeLabel = UILabel()
        badgeLabel.backgroundColor = UIColor(named: C.Colors.goldenAccent)
        
        var size = CGFloat(20)
        
        if let text {
            badgeLabel.text = text
            badgeLabel.textAlignment = .center
            badgeLabel.textColor = .white
            badgeLabel.font = UIFont(name: C.Fonts.latoRegular, size: 15)
            
            size = CGFloat(20 + 2 * text.count)
        }
        
        badgeLabel.clipsToBounds = true
        badgeLabel.cornerRadius = size / 2
        badgeLabel.place(on: self).pin(.fixedWidth(size),
                                           .fixedHeight(size),
                                           .top(padding: -size / 2),
                                           .trailing(padding: -size / 2))
        
    }
}

final class BadgeButton: UIButton, BadgeContainer {}
