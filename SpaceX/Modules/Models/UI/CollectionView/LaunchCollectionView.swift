//
//  LaunchCollectionView.swift
//  SpaceX
//
//  Created by Paul Matar on 03/11/2022.
//

import UIKit

final class LaunchCollectionView: UICollectionView {

    private let launchLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        return layout
    }()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: launchLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .clear
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        launchLayout.itemSize = .init(width: bounds.width / 2.1,
                                      height: bounds.height * 0.9)
    }
}
