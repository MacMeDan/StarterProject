//
//  AutoLayout.swift
//  starterProject
//
//  Created by Dan Leonard on 10/26/17.
//  Copyright © 2017 Macmedan. All rights reserved.
//

import UIKit

typealias Constraint = (_ child: UIView,_ parent: UIView) -> NSLayoutConstraint

func equal<Axis, L>(_ from: KeyPath<UIView, L>, _ to: KeyPath<UIView, L>, _ constant: CGFloat = 0) -> Constraint where L: NSLayoutAnchor<Axis> {
    return { view, parent in
        view[keyPath: from].constraint(equalTo: parent[keyPath: to], constant: constant)
    }
}

func equal<Axis, L>(_ to: KeyPath<UIView, L>, _ constant: CGFloat = 0) -> Constraint  where L: NSLayoutAnchor<Axis> {
    return { view, parent in
        view[keyPath: to].constraint(equalTo: parent[keyPath: to], constant: constant)
    }
}

func equal<L>(_ keyPath: KeyPath<UIView, L>, to constant: CGFloat = 0) -> Constraint  where L: NSLayoutDimension {
    return { view, parent in
        view[keyPath: keyPath].constraint(equalToConstant: constant)
    }
}


// MARK: NSLayoutDimension + Float

public extension NSLayoutDimension {
    /// - Tag: AutoLayout
    // Constant
    
    public func constraint(equalTo anchor: NSLayoutDimension, constant c: CGFloat = 0, priority p: UILayoutPriority = .defaultHigh, multiplier m: CGFloat = 1.0) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor, constant: c)
        constraint.priority = p
        return constraint
    }
    
    public func constraint(lessThanOrEqualTo anchor: NSLayoutDimension, constant c: CGFloat = 0, priority p: UILayoutPriority = .defaultHigh, multiplier m: CGFloat = 1.0) -> NSLayoutConstraint {
        let constraint = self.constraint(lessThanOrEqualTo: anchor, constant: c)
        constraint.priority = p
        return constraint
    }
    
    public func constraint(greaterThanOrEqualTo anchor: NSLayoutDimension, constant c: CGFloat = 0, priority p: UILayoutPriority = .defaultHigh, multiplier m: CGFloat = 1.0) -> NSLayoutConstraint {
        let constraint = self.constraint(greaterThanOrEqualTo: anchor, constant: c)
        constraint.priority = p
        return constraint
    }
}

// MARK: NSLayoutYAxisAnchor + Float

public extension NSLayoutYAxisAnchor {
    // Anchor, Constant
    
    public func constraint(equalTo anchor: NSLayoutYAxisAnchor, constant c: CGFloat = 0, priority p: UILayoutPriority = .defaultHigh) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor, constant: c)
        constraint.priority = p
        return constraint
    }
    
    public func constraint(lessThanOrEqualTo anchor: NSLayoutYAxisAnchor, constant c: CGFloat = 0, priority p: UILayoutPriority = .defaultHigh) -> NSLayoutConstraint {
        let constraint = self.constraint(lessThanOrEqualTo: anchor, constant: c)
        constraint.priority = p
        return constraint
    }
    
    public func constraint(greaterThanOrEqualTo anchor: NSLayoutYAxisAnchor, constant c: CGFloat = 0, priority p: UILayoutPriority = .defaultHigh) -> NSLayoutConstraint {
        let constraint = self.constraint(greaterThanOrEqualTo: anchor, constant: c)
        constraint.priority = p
        return constraint
    }
}

// MARK: NSLayoutXAxisAnchor + Float

public extension NSLayoutXAxisAnchor {
    // Anchor, Constant
    
    public func constraint(equalTo anchor: NSLayoutXAxisAnchor, constant c: CGFloat = 0, priority p: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor, constant: c)
        constraint.priority = p
        return constraint
    }
    
    public func constraint(lessThanOrEqualTo anchor: NSLayoutXAxisAnchor, constant c: CGFloat = 0, priority p: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.constraint(lessThanOrEqualTo: anchor, constant: c)
        constraint.priority = p
        return constraint
    }
    
    public func constraint(greaterThanOrEqualTo anchor: NSLayoutXAxisAnchor, constant c: CGFloat = 0, priority p: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = self.constraint(greaterThanOrEqualTo: anchor, constant: c)
        constraint.priority = p
        return constraint
    }
}
