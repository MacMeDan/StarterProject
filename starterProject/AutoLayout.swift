//
//  AutoLayout.swift
//  starterProject
//
//  Created by Dan Leonard on 10/26/17.
//  Copyright © 2017 Macmedan. All rights reserved.
//

import UIKit
// MARK: NSLayoutDimension + Float

public extension NSLayoutDimension {
    
    // Anchor
    
    public func constraint(equalTo anchor: NSLayoutDimension, priority p: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor)
        constraint.priority = p
        return constraint
    }
    
    public func constraint(lessThanOrEqualTo anchor: NSLayoutDimension, priority p: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(lessThanOrEqualTo: anchor)
        constraint.priority = p
        return constraint
    }
    
    public func constraint(greaterThanOrEqualTo anchor: NSLayoutDimension, priority p: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(greaterThanOrEqualTo: anchor)
        constraint.priority = p
        return constraint
    }
    
    // Constant
    
    public func constraint(equalToConstant c: CGFloat, priority p: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalToConstant: c)
        constraint.priority = p
        return constraint
    }
    
    public func constraint(greaterThanOrEqualToConstant c: CGFloat, priority p: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(greaterThanOrEqualToConstant: c)
        constraint.priority = p
        return constraint
    }
    
    public func constraint(lessThanOrEqualToConstant c: CGFloat, priority p: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(lessThanOrEqualToConstant: c)
        constraint.priority = p
        return constraint
    }
    
    // Anchor, Constant
    
    public func constraint(equalTo anchor: NSLayoutDimension, constant c: CGFloat, priority p: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor, constant: c)
        constraint.priority = p
        return constraint
    }
    
    public func constraint(lessThanOrEqualTo anchor: NSLayoutDimension, constant c: CGFloat, priority p: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(lessThanOrEqualTo: anchor, constant: c)
        constraint.priority = p
        return constraint
    }
    
    public func constraint(greaterThanOrEqualTo anchor: NSLayoutDimension, constant c: CGFloat, priority p: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(greaterThanOrEqualTo: anchor, constant: c)
        constraint.priority = p
        return constraint
    }
    
    // Anchor, Multiplier
    
    public func constraint(equalTo anchor: NSLayoutDimension, multiplier m: CGFloat, priority p: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor, multiplier: m)
        constraint.priority = p
        return constraint
    }
    
    public func constraint(greaterThanOrEqualTo anchor: NSLayoutDimension, multiplier m: CGFloat, priority p: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(greaterThanOrEqualTo: anchor, multiplier: m)
        constraint.priority = p
        return constraint
    }
    
    public func constraint(lessThanOrEqualTo anchor: NSLayoutDimension, multiplier m: CGFloat, priority p: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(lessThanOrEqualTo: anchor, multiplier: m)
        constraint.priority = p
        return constraint
    }
    
    // Anchor, Multiplier, Constant
    
    public func constraint(equalTo anchor: NSLayoutDimension, multiplier m: CGFloat, constant c: CGFloat, priority p: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor, multiplier: m, constant: c)
        constraint.priority = p
        return constraint
    }
    
    public func constraint(greaterThanOrEqualTo anchor: NSLayoutDimension, multiplier m: CGFloat, constant c: CGFloat, priority p: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(greaterThanOrEqualTo: anchor, multiplier: m, constant: c)
        constraint.priority = p
        return constraint
    }
    
    public func constraint(lessThanOrEqualTo anchor: NSLayoutDimension, multiplier m: CGFloat, constant c: CGFloat, priority p: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(lessThanOrEqualTo: anchor, multiplier: m, constant: c)
        constraint.priority = p
        return constraint
    }
}

// MARK: NSLayoutYAxisAnchor + Float

public extension NSLayoutYAxisAnchor {
    
    // Anchor
    
    public func constraint(equalTo anchor: NSLayoutYAxisAnchor, priority p: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor)
        constraint.priority = p
        return constraint
    }
    
    public func constraint(lessThanOrEqualTo anchor: NSLayoutYAxisAnchor, priority p: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(lessThanOrEqualTo: anchor)
        constraint.priority = p
        return constraint
    }
    
    public func constraint(greaterThanOrEqualTo anchor: NSLayoutYAxisAnchor, priority p: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(greaterThanOrEqualTo: anchor)
        constraint.priority = p
        return constraint
    }
    
    // Anchor, Constant
    
    public func constraint(equalTo anchor: NSLayoutYAxisAnchor, constant c: CGFloat, priority p: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor, constant: c)
        constraint.priority = p
        return constraint
    }
    
    public func constraint(lessThanOrEqualTo anchor: NSLayoutYAxisAnchor, constant c: CGFloat, priority p: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(lessThanOrEqualTo: anchor, constant: c)
        constraint.priority = p
        return constraint
    }
    
    public func constraint(greaterThanOrEqualTo anchor: NSLayoutYAxisAnchor, constant c: CGFloat, priority p: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(greaterThanOrEqualTo: anchor, constant: c)
        constraint.priority = p
        return constraint
    }
}

// MARK: NSLayoutXAxisAnchor + Float

public extension NSLayoutXAxisAnchor {
    
    // Anchor
    
    public func constraint(equalTo anchor: NSLayoutXAxisAnchor, priority p: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor)
        constraint.priority = p
        return constraint
    }
    
    public func constraint(lessThanOrEqualTo anchor: NSLayoutXAxisAnchor, priority p: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(lessThanOrEqualTo: anchor)
        constraint.priority = p
        return constraint
    }
    
    public func constraint(greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor, priority p: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(greaterThanOrEqualTo: anchor)
        constraint.priority = p
        return constraint
    }
    
    // Anchor, Constant
    
    public func constraint(equalTo anchor: NSLayoutXAxisAnchor, constant c: CGFloat, priority p: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor, constant: c)
        constraint.priority = p
        return constraint
    }
    
    public func constraint(lessThanOrEqualTo anchor: NSLayoutXAxisAnchor, constant c: CGFloat, priority p: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(lessThanOrEqualTo: anchor, constant: c)
        constraint.priority = p
        return constraint
    }
    
    public func constraint(greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor, constant c: CGFloat, priority p: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(greaterThanOrEqualTo: anchor, constant: c)
        constraint.priority = p
        return constraint
    }
}
