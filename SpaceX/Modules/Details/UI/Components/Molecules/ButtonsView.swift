//
//  ButtonsView.swift
//  SpaceX
//
//  Created by Paul Matar on 06/11/2022.
//

import UIKit

final class ButtonsView: UIView {
    
    private lazy var readMoreButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor(named: C.Colors.skyBlue)
        button.setTitle(C.Text.read, for: .normal)
        button.titleLabel?.font = UIFont(name: C.Fonts.latoRegular, size: 18)
        button.layer.cornerRadius = 6
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.setTitle(C.Text.share, for: .normal)
        button.setTitleColor(UIColor(named: C.Colors.goldenAccent), for: .normal)
        button.titleLabel?.font = UIFont(name: C.Fonts.latoBold, size: 18)
        button.layer.cornerRadius = 6
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        let finalStack = UIStackView(arrangedSubviews: [readMoreButton, shareButton])
        finalStack.axis = .vertical
        finalStack.spacing = 10
        finalStack.distribution = .fillEqually
        finalStack.alignment = .fill
        
        finalStack.place(on: self).pin(.allEdges)
    }
}
