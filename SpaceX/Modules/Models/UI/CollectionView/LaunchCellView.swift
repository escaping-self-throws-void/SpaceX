//
//  LaunchView.swift
//  SpaceX
//
//  Created by Paul Matar on 05/11/2022.
//

import UIKit

final class LaunchCellView: UIView {
    
    lazy var recordLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: C.Fonts.latoExtraBold, size: 18)
        label.textColor = .white
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: C.Fonts.latoRegular, size: 12)
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var flightNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: C.Fonts.latoBold, size: 13)
        label.textColor = .white
        label.numberOfLines = 0
        label.place(on: self)
        return label
    }()
    
    lazy var indicatorLine: IndicatorLine = {
        let view = IndicatorLine()
        view.place(on: self)
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        commonInit()
    }
    
    private func commonInit() {
        let topStack = UIStackView(arrangedSubviews: [recordLabel, dateLabel])
        topStack.axis = .vertical
        topStack.alignment = .fill
        topStack.distribution = .fillProportionally
        
        let inset: CGFloat = 5
        
        topStack.place(on: self).pin(
            .top,
            .leading(padding: inset),
            .trailing(padding: inset),
            .fixedHeight(50)
        )
        
        flightNameLabel.pin(
            .bottom(to: indicatorLine, padding: 25),
            .leading(padding: inset),
            .trailing(padding: inset)
        )
        
        indicatorLine.pin(
            .fixedHeight(4),
            .leading,
            .trailing,
            .bottom
        )
    }
}
