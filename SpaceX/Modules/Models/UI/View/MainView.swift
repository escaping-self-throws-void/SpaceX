//
//  MainView.swift
//  SpaceX
//
//  Created by Paul Matar on 04/11/2022.
//

import UIKit

final class MainView: UIView {
    
    lazy var collectionView: LaunchCollectionView = {
        let collectionView = LaunchCollectionView()
        collectionView.backgroundColor = .red
        collectionView.place(on: self)
        return collectionView
    }()
    
    private lazy var bottomColorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: C.Colors.goldenAccent)
        view.place(on: self)
        return view
    }()
    
    private lazy var bottomStaticView: BottomStaticView = {
        let view = BottomStaticView()
        view.place(on: self)
        return view
    }()
     
    override func layoutSubviews() {
        super.layoutSubviews()
        commonInit()
    }

    private func commonInit() {
        bottomColorView.pin(
            .bottom,
            .fixedHeight(bounds.height * 0.33),
            .leading,
            .trailing
        )
        
        collectionView.pin(
            .top(to: safeAreaLayoutGuide, padding: 15),
            .bottom(to: bottomStaticView, .top, padding: 15),
            .leading,
            .trailing
        )
        
        bottomStaticView.pin(
            .bottom(to: safeAreaLayoutGuide, padding: 10),
            .trailing(padding: 32),
            .leading(padding: 25),
            .fixedHeight(bounds.height * 0.55)
        )
    }
}
