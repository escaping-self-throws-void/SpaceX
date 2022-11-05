//
//  LaunchCell.swift
//  SpaceX
//
//  Created by Paul Matar on 03/11/2022.
//

import UIKit

final class LaunchCell: UICollectionViewCell {
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        let color = UIColor(named: C.Colors.skyBlue) ?? .blue
        imageView.addoverlay(color: color, alpha: 0.73)
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var launchView: LaunchCellView = {
        let view = LaunchCellView()
//        view.place(on: contentView)
        return view
    }()
    
//    override class func awakeFromNib() {
//        super.awakeFromNib()
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: .zero)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        commonInit()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundImage.image = nil
    }
    
    func configure(with model: LaunchModel) {
        launchView.recordLabel.text = model.flightNumber
        launchView.flightNameLabel.text = model.name
        launchView.dateLabel.text = model.date
    }
    
    private func commonInit() {
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 8
        
        backgroundImage.place(on: contentView).pin(.allEdges)
        backgroundImage.image = UIImage(named: C.Images.cellPlaceholder)
        
        launchView.place(on: contentView).pin(.allEdges(padding: 18))
    }
}
