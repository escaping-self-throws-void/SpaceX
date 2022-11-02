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
        
        if let badgeView = badgeView, !badgeView.isHidden {
            return
        } else {
            badgeView = UIView()
        }
        
        badgeView?.backgroundColor = UIColor(named: C.Colors.goldenAccent)
        
        guard let badgeViewUnwrapped = badgeView else {
            return
        }

        addSubview(badgeViewUnwrapped)
        badgeViewUnwrapped.translatesAutoresizingMaskIntoConstraints = false
        
        var size = CGFloat(6)
        
        if let textUnwrapped = text {
            let labelUnwrapped = badgeLabel ?? UILabel()
            
            labelUnwrapped.text = textUnwrapped
            labelUnwrapped.textAlignment = .center
            labelUnwrapped.textColor = .white
            labelUnwrapped.font = UIFont(name: C.Fonts.latoRegular, size: 15)
            labelUnwrapped.translatesAutoresizingMaskIntoConstraints = false
            
            badgeViewUnwrapped.addSubview(labelUnwrapped)
            let labelConstrainst = [labelUnwrapped.centerXAnchor.constraint(equalTo: badgeViewUnwrapped.centerXAnchor),
                                    labelUnwrapped.centerYAnchor.constraint(equalTo: badgeViewUnwrapped.centerYAnchor)]
            NSLayoutConstraint.activate(labelConstrainst)
            
            size = CGFloat(20 + 2 * textUnwrapped.count)
        }
        
        let sizeConstraints = [badgeViewUnwrapped.widthAnchor.constraint(equalToConstant: size), badgeViewUnwrapped.heightAnchor.constraint(equalToConstant: size)]
        NSLayoutConstraint.activate(sizeConstraints)
        
        badgeViewUnwrapped.cornerRadius = size / 2
        
        let position = [badgeViewUnwrapped.topAnchor.constraint(equalTo: self.topAnchor, constant: -size / 2),
                        badgeViewUnwrapped.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: size/2)]
        NSLayoutConstraint.activate(position)
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
