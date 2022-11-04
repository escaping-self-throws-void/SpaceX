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
        label.text = "The Big Launch"
        label.textColor = .black
        return label
    }()
    
    private lazy var firstBttn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor(named: C.Colors.goldenAccent)
        button.setTitle("G O L D", for: .normal)
        button.titleLabel?.font = UIFont(name: C.Fonts.latoBold, size: 9)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var secondBttn: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("S P A C E  S H I P S", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: C.Fonts.latoBold, size: 9)
        return button
    }()
    
    private lazy var bottomPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: C.Images.bottom)
        imageView.addoverlay(alpha: 0.4)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
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
        let spacer = UIView()
        let buttonsStack = UIStackView(arrangedSubviews: [firstBttn, secondBttn, spacer])
        buttonsStack.spacing = 5
        buttonsStack.distribution = .fill
        buttonsStack.alignment = .leading
        
        buttonsStack.pin(.fixedHeight(20))
        
        firstBttn.pin(.fixedWidth(56))
        secondBttn.pin(.fixedWidth(80))
    
        bottomPhoto.pin(.fixedHeight(213))
        
        let finalStack = UIStackView(arrangedSubviews: [bigTitle, buttonsStack, bottomPhoto])
        finalStack.axis = .vertical
        finalStack.spacing = 15
        finalStack.distribution = .fillProportionally
        finalStack.alignment = .fill
        
        finalStack.place(on: self).pin(.allEdges)
    }
}
