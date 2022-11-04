//
//  MainView.swift
//  SpaceX
//
//  Created by Paul Matar on 04/11/2022.
//

import UIKit

final class MainView: UIView {
    
    private lazy var bottomColorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: C.Colors.goldenAccent)
        view.place(on: self)
        return view
    }()
    
    private lazy var bigLaunchView = BigLaunchView()
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        bottomColorView.pin(
            .bottom,
            .fixedHeight(278),
            .leading,
            .trailing
        )
        
        bigLaunchView.place(on: self).pin(
            .leading(padding: 25),
            .trailing(padding: 25),
            .bottom(padding: 150)
        )
        
        let rview = BorderedAvatarView()
        
        rview.place(on: self).pin(
            .fixedHeight(60),
            .fixedWidth(60),
            .bottom(padding: 125),
            .leading(padding: 47)
        )
        
    }
}


