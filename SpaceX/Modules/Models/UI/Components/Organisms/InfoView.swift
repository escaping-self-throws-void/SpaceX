//
//  InfoView.swift
//  SpaceX
//
//  Created by Paul Matar on 05/11/2022.
//

import UIKit

final class InfoView: UIView {
    
    private lazy var container = UIView()
    
    private lazy var staticTextView = StaticTextView()
    
    private lazy var avatarRecordView: AvatarRecordView = {
        let view = AvatarRecordView()
        view.place(on: container)
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
        avatarRecordView.pin(
            .top(padding: 45),
            .trailing,
            .leading,
            .bottom(padding: 40)
        )
        container.pin(.fixedWidth(85))

        let stack = UIStackView(arrangedSubviews: [container, staticTextView])
        stack.axis = .horizontal
        stack.spacing = 25
        stack.place(on: self).pin(.allEdges)
    }
}
