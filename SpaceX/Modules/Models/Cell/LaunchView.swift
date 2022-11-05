//
//  LaunchView.swift
//  SpaceX
//
//  Created by Paul Matar on 05/11/2022.
//

import UIKit

final class LaunchView: UIView {
    
    private lazy var recordLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: C.Fonts.visbyExtraBold, size: 18)
        label.text = "34787"
        label.textColor = .white
//        label.place(on: self)
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: C.Fonts.visbyBold, size: 12)
        label.text = "25 Feb 2022, 11:25 GMT 5"
        label.textColor = .white
//        label.place(on: self)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: C.Fonts.latoBold, size: 13)
        label.text = "Columbia launching"
        label.textColor = .white
        label.numberOfLines = 0
//        label.place(on: self)
        return label
    }()
    
    private lazy var whiteLine: UIView = {
        let view = UIView()
        view.frame = .init(x: 0, y: 0, width: .zero, height: 2)
        return view
    }()
    
    private lazy var goldenLine: UIView = {
        let view = UIView()
        view.frame = .init(x: 0, y: 0, width: whiteLine.frame.width/2, height: 2)
        view.backgroundColor = UIColor(named: C.Colors.goldenAccent)
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
        
        topStack.place(on: self).pin(
            .top,
            .leading,
            .trailing
        )
        
        let bottomStack = UIStackView(arrangedSubviews: [descriptionLabel, whiteLine])
        topStack.axis = .vertical
        
        topStack.place(on: self).pin(
            .bottom,
            .leading,
            .trailing
        )
    }
    
}
