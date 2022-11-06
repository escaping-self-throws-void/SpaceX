//
//  GradientImageView.swift
//  SpaceX
//
//  Created by Paul Matar on 06/11/2022.
//

import UIKit

final class GradientImageView: UIImageView {
    
    private lazy var defaultPath: UIBezierPath = {
        let path = UIBezierPath()
        let radius: CGFloat = 20
        
        path.addArc(withCenter: CGPoint(x: bounds.width - 100, y: 100), radius: radius, startAngle: CGFloat.pi * 3 / 2, endAngle: 0, clockwise: true)

        return path
    }()
    
    private lazy var borderLayer: CAShapeLayer = {
        let borderLayer = CAShapeLayer()
        
        borderLayer.path = defaultPath.cgPath
        borderLayer.lineWidth = 30
        borderLayer.strokeColor = UIColor(named: C.Colors.skyBlue)?.cgColor
        borderLayer.fillColor = UIColor.clear.cgColor
        
        return borderLayer
    }()
    
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

        layer.addSublayer(gradientLayer)
//        layer.addSublayer(borderLayer)
    }
}
