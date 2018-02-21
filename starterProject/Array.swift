//
//  Array.swift
//  starterProject
//
//  Created by Dan Leonard on 10/26/17.
//  Copyright © 2017 Macmedan. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Gradient
public extension Array where Element : UIColor {
    /// - Tag: ArrayGradient
    public func gradient(_ transform: ((_ gradient: inout CAGradientLayer) -> CAGradientLayer)? = nil) -> CAGradientLayer {
        var gradient = CAGradientLayer()
        gradient.colors = self.map { $0.cgColor }
        
        if let transform = transform {
            gradient = transform(&gradient)
        }
        return gradient
    }
}
