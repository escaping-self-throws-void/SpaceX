//
//  UITextView.swift
//  SpaceX
//
//  Created by Paul Matar on 06/11/2022.
//

import UIKit

extension UITextView {
    
    func setLineHeight(_ lineHeight: CGFloat) {
        guard let text, let font, let textColor else { return }
        
        let attributeString = NSMutableAttributedString(string: text,
                                                        attributes: [.font: font,
                                                                     .foregroundColor: textColor])
        let style = NSMutableParagraphStyle()
        
        style.lineSpacing = lineHeight
        attributeString.addAttribute(
            NSAttributedString.Key.paragraphStyle,
            value: style,
            range: NSMakeRange(0, attributeString.length)
        )
        self.attributedText = attributeString
    }
}
