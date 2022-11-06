//
//  BottomView.swift
//  SpaceX
//
//  Created by Paul Matar on 06/11/2022.
//

import UIKit

final class BottomView: UIView {
    
    private lazy var topInfoView = TopInfoView()
    private lazy var descriptionView = DescriptionView()
    private lazy var buttonsView = ButtonsView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        layer.cornerRadius = 30
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        topInfoView.pin(.fixedHeight(bounds.height * 0.08))
        buttonsView.pin(.fixedHeight(bounds.height * 0.25))

        let stack = UIStackView(arrangedSubviews: [topInfoView, descriptionView, buttonsView])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 10
        stack.place(on: self).pin(.allEdges(padding: 25))
    }
}
