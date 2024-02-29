//
//  String.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 20.02.2024.
//

import UIKit
extension String {
    func createLine(spacing: CGFloat) -> NSMutableAttributedString{
        let attributedString = NSMutableAttributedString(string:self)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        return attributedString
    }
    
}
