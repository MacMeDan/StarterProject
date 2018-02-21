//
//  UIButton.swift
//  starterProject
//
//  Created by Dan Leonard on 10/26/17.
//  Copyright © 2017 Macmedan. All rights reserved.
//

import UIKit

extension UIButton {
    /// - Tag: Button
    func roundCorners() {
        self.layer.cornerRadius = self.frame.size.height/2
        self.clipsToBounds = true
        self.layoutIfNeeded()
    }
    
    func spaceBetweenImageAndText(space: CGFloat) {
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: space, bottom: 0, right: 0)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: space)
    }
    
    func textUnderRoundImage(tintColor: UIColor = .white) {
        let spacing: CGFloat = 6.0
        guard let imgView = self.imageView, let img = imgView.image, let buttonTitle = self.titleLabel else {
            return assertionFailure("The img or button was nil")
        }
        
        let imageSize: CGSize = img.size
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width, bottom: -(imageSize.height + spacing), right: 0)
        
        if let text = buttonTitle.text {
            let titleSize = text.size(withAttributes: [NSAttributedStringKey.font: buttonTitle.font])
            self.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0, bottom: 0, right: -titleSize.width)
        }
        
        self.tintColor = tintColor
        self.backgroundColor = .white
        self.roundCorners()
    }
    
    func textOverImg(font: UIFont) {
        guard let imgView = self.imageView, let img = imgView.image else {
            return assertionFailure("The img was nil")
        }
        let imageSize: CGSize = img.size
        let spaceBelowText = CGFloat(10)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width, bottom: imageSize.height + spaceBelowText, right: 0)
        
        guard let buttonTitle = self.titleLabel else {
            return assertionFailure("buttonTitle was nil")
        }
        
        // We set the font here so we know how much we need to offset the Image of the button.
        buttonTitle.font = font
        if let text = buttonTitle.text {
            let titleSize = text.size(withAttributes: [NSAttributedStringKey.font: buttonTitle.font])
            self.imageEdgeInsets = UIEdgeInsets(top: (titleSize.height), left: 0, bottom: 0, right: -(titleSize.width))
        }
        
    }
    // This method will increase the "tappable area" (actual size) of the button, while preserving
    // the original center, title size, and image size.
    func increaseTappableAreaBy(thisMuch: CGFloat) {
        frame = CGRect(
            x: x - thisMuch,
            y: y - thisMuch,
            width: w + thisMuch * 2,
            height: h + thisMuch * 2
        )
        titleEdgeInsets = UIEdgeInsets(
            top: thisMuch,
            left: thisMuch,
            bottom: thisMuch,
            right: thisMuch
        )
        imageEdgeInsets = UIEdgeInsets(
            top: thisMuch,
            left: thisMuch,
            bottom: thisMuch,
            right: thisMuch
        )
    }
    
    func set(imageNamed: String, tintColor: UIColor) {
        guard let imageView = self.imageView else { return }
        imageView.tintColor = tintColor
        guard let image = UIImage(named: imageNamed) else { return }
        self.setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
        self.setImage(image.withRenderingMode(.alwaysTemplate), for: .selected)
    }
}
