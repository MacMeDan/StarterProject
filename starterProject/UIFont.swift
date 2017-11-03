//
//  UIFont.swift
//  starterProject
//
//  Created by Dan Leonard on 10/26/17.
//  Copyright © 2017 Macmedan. All rights reserved.
//

import UIKit

extension UIFont {
    
    func withTraits(traits: UIFontDescriptorSymbolicTraits...) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(UIFontDescriptorSymbolicTraits(traits)) else {
            return UIFont()
        }
        return UIFont(descriptor: descriptor, size: 0)
    }
    
    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }
    
    func italic() -> UIFont {
        return withTraits(traits: .traitItalic)
    }
    
    func reg() -> UIFont {
        return withTraits()
    }
    
}
