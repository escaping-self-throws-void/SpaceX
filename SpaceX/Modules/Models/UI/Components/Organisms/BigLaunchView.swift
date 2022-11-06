//
//  BigLaunchView.swift
//  SpaceX
//
//  Created by Paul Matar on 04/11/2022.
//

import UIKit

final class BigLaunchView: UIView {
    
    private lazy var bigTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: C.Fonts.latoBold, size: 25)
        label.text = C.Text.big
        label.textColor = .black
        return label
    }()
    
    private lazy var firstBttn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor(named: C.Colors.goldenAccent)
        button.setTitle(C.Text.gold, for: .normal)
        button.titleLabel?.font = UIFont(name: C.Fonts.latoBold, size: 9)
        button.layer.cornerRadius = 10
            button.place(on: buttonContainer)
        return button
    }()
    
    private lazy var secondBttn: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(C.Text.space, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: C.Fonts.latoBold, size: 9)
        button.place(on: buttonContainer)
        return button
    }()
    
    private lazy var bottomPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: C.Images.bottom)
        imageView.contentMode = .scaleAspectFill
        imageView.addoverlay(alpha: 0.5)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    private lazy var buttonContainer = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        firstBttn.pin(
            .leading,
            .top,
            .bottom,
            .fixedWidth(56)
        )

        secondBttn.pin(
            .leading(padding: 65),
            .top,
            .bottom
        )
        
        bigTitle.pin(.fixedHeight(30))
        buttonContainer.pin(.fixedHeight(20))
        
        let finalStack = UIStackView(arrangedSubviews: [bigTitle, buttonContainer, bottomPhoto])
        finalStack.axis = .vertical
        finalStack.spacing = 15
        finalStack.distribution = .fillProportionally
        finalStack.alignment = .fill
        
        finalStack.place(on: self).pin(.allEdges)
    }
}
