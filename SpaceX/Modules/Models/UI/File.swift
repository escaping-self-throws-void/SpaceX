//
//  File.swift
//  SpaceX
//
//  Created by Paul Matar on 05/11/2022.
//

import UIKit

final class BorderedAvatarView: UIView {
    
    private lazy var avatarView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: C.Images.avatar)
        imageView.frame = .init(x: 0, y: 0, width: 42, height: 42)
        imageView.layer.cornerRadius = 21
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        layer.cornerRadius = 30
        backgroundColor = UIColor(named: C.Colors.goldenAccent)
        avatarView.place(on: self).pin(.centerX, .centerY)
    }
    
}
