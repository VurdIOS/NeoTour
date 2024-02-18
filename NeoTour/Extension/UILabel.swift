//
//  UILabel.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 18.02.2024.
//

import UIKit

extension UILabel {
    func addImage(image: UIImage) {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = image
        let spaceString = NSMutableAttributedString(string: "  ")
        let imageString = NSAttributedString(attachment: imageAttachment)
        let attributedString = NSMutableAttributedString(attributedString: attributedText ?? NSAttributedString())
        attributedString.insert(imageString, at: 0)
        attributedString.insert(spaceString, at: 1)
        attributedText = attributedString
    }
}
