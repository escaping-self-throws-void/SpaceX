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
        label.font = UIFont(name: C.Fonts.visbyExtraBold, size: 18)
        label.textColor = .white
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: C.Fonts.visbyBold, size: 12)
        label.textColor = .white
        label.allowsDefaultTighteningForTruncation = true
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
    
    private lazy var whiteLine: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 2
        view.place(on: self)
        return view
    }()
    
    private lazy var goldenLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: C.Colors.goldenAccent)
        view.layer.cornerRadius = 2
        view.place(on: whiteLine)
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        commonInit()
    }
    
    private func commonInit() {
        
        let topStack = UIStackView(arrangedSubviews: [recordLabel, dateLabel])
        topStack.axis = .vertical
        
        let inset: CGFloat = 5
        
        topStack.place(on: self).pin(
            .top,
            .leading(padding: inset),
            .trailing(padding: inset)
        )
        
        flightNameLabel.pin(
            .bottom(to: whiteLine, padding: 25),
            .leading(padding: inset),
            .trailing(padding: inset)
        )
        
        whiteLine.pin(
            .fixedHeight(4),
            .leading,
            .trailing,
            .bottom
        )
        
        goldenLine.pin(
            .leading,
            .trailing(to: whiteLine, .centerX),
            .top,
            .bottom
        )
    }
}
