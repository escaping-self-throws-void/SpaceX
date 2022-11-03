//
//  LaunchCell.swift
//  SpaceX
//
//  Created by Paul Matar on 03/11/2022.
//

import UIKit

final class LaunchCell: UICollectionViewCell {
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        removeSubviews()
    }
}
