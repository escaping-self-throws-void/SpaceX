//
//  IndicatorLine.swift
//  SpaceX
//
//  Created by Paul Matar on 06/11/2022.
//

import UIKit

final class IndicatorLine: UIView {
    
    private lazy var goldenLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: C.Colors.goldenAccent)
        view.layer.cornerRadius = 2
        view.place(on: self)
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        layer.cornerRadius = 2
        
        goldenLine.pin(
            .leading,
            .trailing(to: self, .centerX),
            .top,
            .bottom
        )
    }
}
