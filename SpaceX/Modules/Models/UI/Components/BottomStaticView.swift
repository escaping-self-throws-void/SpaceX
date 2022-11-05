//
//  BottomStaticView.swift
//  SpaceX
//
//  Created by Paul Matar on 05/11/2022.
//

import UIKit

final class BottomStaticView: UIView {
    
    private lazy var bigLaunchView: BigLaunchView = {
        let view = BigLaunchView()
        view.place(on: self)
        return view
    }()
    
    private lazy var infoView: InfoView = {
        let view = InfoView()
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
        bigLaunchView.pin(
            .top,
            .leading,
            .trailing,
            .height(to: self, padding: -135)
        )
        
        infoView.pin(
            .bottom,
            .trailing,
            .leading,
            .top(to: bigLaunchView, .bottom, padding: -70)
        )
    }
}
