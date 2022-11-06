//
//  StaticTextView.swift
//  SpaceX
//
//  Created by Paul Matar on 05/11/2022.
//

import UIKit

final class StaticTextView: UIView {
    
    private lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: C.Fonts.latoRegular, size: 10)
        label.text = C.Text.by
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: C.Fonts.latoBold, size: 16)
        label.text = C.Text.iss
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: C.Fonts.latoRegular, size: 10)
        label.text = C.Text.lorem
        label.numberOfLines = 0
        label.textAlignment = .left
        label.setLineHeight(5)
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
        let labelStack = UIStackView(arrangedSubviews: [firstLabel, secondLabel])
        labelStack.axis = .vertical
        labelStack.spacing = 0
        labelStack.distribution = .fillProportionally
        
        let finalStack = UIStackView(arrangedSubviews: [labelStack, textLabel])
        finalStack.axis = .vertical
        finalStack.spacing = 10
        finalStack.distribution = .fillProportionally
        finalStack.place(on: self).pin(.allEdges)
    }
}
