//
//  UIStackViews.swift
//  starterProject
//
//  Created by Dan Leonard on 4/18/18.
//  Copyright © 2018 Macmedan. All rights reserved.
//

import UIKit

extension UIStackView {
    convenience init(axis: UILayoutConstraintAxis, alignment: UIStackViewAlignment, distribution: UIStackViewDistribution, spacing: CGFloat, arrangedSubviews: [UIView] = []) {
        self.init()
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
        arrangedSubviews.forEach { addArrangedSubview($0) }
    }
    
    convenience init(axis: UILayoutConstraintAxis, alignment: UIStackViewAlignment, distribution: UIStackViewDistribution, spacing: CGFloat, arrangedSubviews: UIView...) {
        self.init(axis: axis, alignment: alignment, distribution: distribution, spacing: spacing, arrangedSubviews: arrangedSubviews)
    }
}
