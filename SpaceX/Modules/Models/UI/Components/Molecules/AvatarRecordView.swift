//
//  AvatarRecordView.swift
//  SpaceX
//
//  Created by Paul Matar on 05/11/2022.
//

import UIKit

final class AvatarRecordView: UIView {
    
    private lazy var borderedAvatarView: BorderedAvatarView = {
        let view = BorderedAvatarView()
        view.place(on: self)
        return view
    }()
    
    private lazy var recordLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: C.Fonts.visbyExtraBold, size: 18)
        label.text = "2355"
        label.textColor = .white
        label.place(on: self)
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: C.Fonts.visbyBold, size: 12)
        label.text = "25 Feb 2022 \n11:25 GMT 5"
        label.numberOfLines = 0
        label.textColor = .white
        label.place(on: self)
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
        borderedAvatarView.pin(
            .top(),
            .trailing(),
            .fixedHeight(60),
            .fixedWidth(60)
        )
        
        recordLabel.pin(
            .top(to: borderedAvatarView, .bottom),
            .leading()
        )
        
        dateLabel.pin(
            .top(to: recordLabel, .bottom, padding: 10),
            .leading()
        )
    }
}
