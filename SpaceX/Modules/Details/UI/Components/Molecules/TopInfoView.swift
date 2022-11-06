//
//  TopInfoView.swift
//  SpaceX
//
//  Created by Paul Matar on 06/11/2022.
//

import UIKit

final class TopInfoView: UIView {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: C.Fonts.latoBold, size: 20)
        label.textColor = .black
        label.textAlignment = .left
        label.place(on: self)
        return label
    }()
    
    lazy var recordLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: C.Fonts.latoBold, size: 20)
        label.textColor = UIColor(named: C.Colors.skyBlue)
        label.textAlignment = .right
        label.place(on: self)
        return label
    }()
    
    private lazy var line: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        view.place(on: self)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        nameLabel.pin(
            .top,
            .leading
        )
        
        recordLabel.pin(
            .top,
            .trailing
        )
        
        line.pin(
            .bottom,
            .leading,
            .trailing,
            .fixedHeight(0.5)
        )
    }
}
