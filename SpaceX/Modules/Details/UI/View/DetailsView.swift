//
//  DetailsView.swift
//  SpaceX
//
//  Created by Paul Matar on 06/11/2022.
//

import UIKit

final class DetailsView: UIView {
    
    lazy var backgroundImageView: GradientImageView = {
        let imageView = GradientImageView()
        imageView.addGradient(top: .init(named: C.Colors.gradientTop),
                              bottom: .init(named: C.Colors.skyBlue))
        imageView.image = UIImage(named: C.Images.bottom)
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: C.Images.cellPlaceholder)
        return imageView
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = .init(x: 0, y: 0, width: 36, height: 36)
        button.setImage(.init(named: C.Images.closeButton), for: .normal)
        return button
    }()
    
    lazy var bottomView = BottomView()
    
    lazy var indicatorLine = IndicatorLine()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        placeSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        commonInit()
    }
    
    private func placeSubviews() {
        backgroundImageView.place(on: self)
        closeButton.place(on: self)
        bottomView.place(on: self)
        indicatorLine.place(on: self)
    }

    private func commonInit() {
        backgroundColor = .clear
        backgroundImageView.pin(
            .top,
            .leading,
            .trailing,
            .fixedHeight(bounds.height * 0.55)
        )
        
        closeButton
            .pin(
            .top(to: safeAreaLayoutGuide, padding: 20),
            .trailing(padding: 20)
        )
        
        bottomView.pin(
            .bottom,
            .trailing,
            .leading,
            .fixedHeight(bounds.height * 0.55)
        )
        
        indicatorLine.pin(
            .fixedHeight(4),
            .leading(padding: 50),
            .trailing(padding: 50),
            .bottom(to: bottomView, .top, padding: 25)
        )
    }
}
