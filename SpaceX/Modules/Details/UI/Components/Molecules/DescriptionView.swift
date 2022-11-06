//
//  DescriptionView.swift
//  SpaceX
//
//  Created by Paul Matar on 06/11/2022.
//

import UIKit

final class DescriptionView: UIView {
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: C.Fonts.latoRegular, size: 17)
        label.text = "24 Feb 2022, 11:25 GMT+5"
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: C.Colors.silverGrey)
        label.font = UIFont(name: C.Fonts.latoRegular, size: 16)
        label.adjustsFontSizeToFitWidth = true
        label.text = "Missions teams are targeting no earlier than February 24, 2022, for the launch of NASA's SpaceX Crew-4 mission to the space station for a six-month science mission aboard the microgravity laboratory."
        label.numberOfLines = 0
        label.textAlignment = .left
        label.setLineHeight(10)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        dateLabel.pin(.fixedHeight(20))
        
        let stack = UIStackView(arrangedSubviews: [dateLabel, descriptionLabel])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 2
        stack.place(on: self).pin(.allEdges)
    }
}
