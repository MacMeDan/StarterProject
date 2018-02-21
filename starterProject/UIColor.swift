//
//  Color.swift
//  starterProject
//
//  Created by Dan Leonard on 10/26/17.
//  Copyright © 2017 Macmedan. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {
    /// - Tag: Color
    class func colorWithRGB(_ rgbValue: UInt, alpha: CGFloat = 1.0) -> UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255
        let green = CGFloat((rgbValue & 0xFF00) >> 8) / 255
        let blue = CGFloat(rgbValue & 0xFF) / 255
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    static func fromRGB(R: CGFloat, G: CGFloat, B: CGFloat, alpha: CGFloat = 10) -> UIColor {
        return UIColor(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: alpha)
    }
    
    // Leveraged for getting gradient colors
    /// - Tag: Gradient
    class func interpolate(_ from: UIColor, to: UIColor, progress: CGFloat) -> UIColor {
        var from_red: CGFloat = 0
        var from_green: CGFloat = 0
        var from_blue: CGFloat = 0
        var from_alpha: CGFloat = 0
        from.getRed(&from_red, green: &from_green, blue: &from_blue, alpha: &from_alpha)
        
        var to_red: CGFloat = 0
        var to_green: CGFloat = 0
        var to_blue: CGFloat = 0
        var to_alpha: CGFloat = 0
        to.getRed(&to_red, green: &to_green, blue: &to_blue, alpha: &to_alpha)
        
        let interpolate = { (from: CGFloat, to: CGFloat) -> CGFloat in
            from + (to - from) * progress
        }
        
        return UIColor(
            red: interpolate(from_red, to_red),
            green: interpolate(from_green, to_green),
            blue: interpolate(from_blue, to_blue),
            alpha: interpolate(from_alpha, to_alpha)
        )
    }
    
}
