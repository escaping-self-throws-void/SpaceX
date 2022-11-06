//
//  GradientImageView.swift
//  SpaceX
//
//  Created by Paul Matar on 06/11/2022.
//

import UIKit

final class GradientImageView: UIImageView {
    
    private var topColor: UIColor?
    private var bottomColor: UIColor?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        commonInit()
    }
    
    func addGradient(top: UIColor?, bottom: UIColor?) {
        topColor = top
        bottomColor = bottom
    }
    
    private func commonInit() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        
        let topColor = topColor ?? .clear
        let bottomColor = bottomColor ?? .clear
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.locations = [0.0, 1.0]

        layer.insertSublayer(gradientLayer, at: 0)
    }
}
