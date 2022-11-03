//
//  Badge.swift
//  SpaceX
//
//  Created by Paul Matar on 02/11/2022.
//

import UIKit

protocol BadgeContainer: AnyObject {
    var badgeView: UIView? { get set }
    var badgeLabel: UILabel? { get set }
    func showBadge(text: String?)
    func hideBadge()
}

extension BadgeContainer where Self: UIView {
    
    func showBadge(text: String?) {
        guard badgeView == nil else { return }
        
        badgeView = UIView()

        badgeView?.backgroundColor = UIColor(named: C.Colors.goldenAccent)
        
        guard let badgeViewUnwrapped = badgeView else { return }

        badgeViewUnwrapped.place(on: self)
        
        var size = CGFloat(6)
        
        if let textUnwrapped = text {
            let labelUnwrapped = badgeLabel ?? UILabel()
            
            labelUnwrapped.text = textUnwrapped
            labelUnwrapped.textAlignment = .center
            labelUnwrapped.textColor = .white
            labelUnwrapped.font = UIFont(name: C.Fonts.latoRegular, size: 15)
            labelUnwrapped.place(on: badgeViewUnwrapped).pin(.centerX, .centerY)
            
            size = CGFloat(20 + 2 * textUnwrapped.count)
        }
        
        badgeViewUnwrapped.cornerRadius = size / 2
        
        badgeViewUnwrapped.pin(.fixedWidth(size),
                               .fixedHeight(size),
                               .top(padding: -size / 2),
                               .trailing(padding: -size / 2))
    }
    
    func hideBadge() {
        badgeView?.removeFromSuperview()
        badgeView = nil
        badgeLabel = nil
    }
}

final class BadgeButton: UIButton, BadgeContainer {
    var badgeView: UIView?
    var badgeLabel: UILabel?
}
