//
//  DescriptionView.swift
//  SpaceX
//
//  Created by Paul Matar on 06/11/2022.
//

import UIKit

final class DescriptionView: UIView {
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: C.Fonts.latoRegular, size: 17)
        return label
    }()
    
    lazy var descriptionLabel: UITextView = {
        let label = UITextView()
        label.textColor = UIColor(named: C.Colors.silverGrey)
        label.font = UIFont(name: C.Fonts.latoRegular, size: 16)
        label.isSelectable = false
        label.isEditable = false
        label.textAlignment = .left
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
        
        
        
        let labelContainer = UIView()
        descriptionLabel.place(on: labelContainer).pin(
            .leading(padding: -5),
            .top(padding: 5),
            .trailing,
            .bottom(padding: 5)
        )
        
        let stack = UIStackView(arrangedSubviews: [dateLabel, labelContainer])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 15
        stack.place(on: self).pin(.allEdges)
    }
}


