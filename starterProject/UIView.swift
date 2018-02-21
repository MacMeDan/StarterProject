//
//  UIView.swift
//  starterProject
//
//  Created by Dan Leonard on 10/26/17.
//  Copyright © 2017 Macmedan. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    /// - Tag: View
    var x: CGFloat {
        set {
            frame = CGRect(x: newValue, y: frame.origin.y, width: frame.size.width, height: frame.size.height)
        } get {
            return frame.origin.x
        }
    }
    
    var y: CGFloat {
        set {
            frame = CGRect(x: frame.origin.x, y: newValue, width: frame.size.width, height: frame.size.height)
        } get {
            return frame.origin.y
        }
    }
    
    var w: CGFloat {
        set {
            frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: newValue, height: frame.size.height)
        } get {
            return frame.size.width
        }
    }
    
    var h: CGFloat {
        set {
            frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: newValue)
        } get {
            return frame.size.height
        }
    }
    
    var width: CGFloat {
        set {
            w = newValue
        } get {
            return w
        }
    }
    
    var height: CGFloat {
        set {
            h = newValue
        } get {
            return h
        }
    }
    
    var f: CGPoint {
        return CGPoint(x: self.frame.size.width / 2.0, y: self.frame.size.height / 2.0)
    }
    
    var size: CGSize {
        set {
            frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: newValue.width, height: newValue.height)
        } get {
            return frame.size
        }
    }
    
    var right: CGFloat {
        get {
            return x + width
        } set {
            x = newValue - width
        }
    }
    
    var bottom: CGFloat {
        get {
            return y + height
        } set {
            y = newValue - height
        }
    }
    
    var centerY: CGFloat {
        get {
            return center.y
        } set {
            center = CGPoint(x: center.x, y: newValue)
        }
    }
}
