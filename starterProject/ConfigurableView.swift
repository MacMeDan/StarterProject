//
//  ConfigurableView.swift
//  starterProject
//
//  Created by Dan Leonard on 10/26/17.
//  Copyright © 2017 Macmedan. All rights reserved.
//

import Foundation
import UIKit

@objc public protocol ConfigurableView {
    @objc optional func configure()
    @objc optional func startObservingSizeCategoryNotifications()
    @objc optional func stopObservingSizeCategoryNotifications()
    
    /// Configure subview appearances and properties
    @objc optional func configureSubviews()
    
    /// Configure subview appearances and properties that are affected by size catgory changes
    @objc optional func configureSizeCategorySubviews()
    
    /// Configure subview appearances and properties that are dependent on a `UITraitCollection`
    @objc optional func configureTraitableViews(with traitCollection: UITraitCollection)
    
    /// Configure subview hierarchy, layout margins, and layouts
    @objc optional func configureLayout()
    
    /// Configure gesture recognizers and add them to the appropriate subview
    @objc optional func configureGestureRecognizers()
    
    /// Configure reactive bindings
    @objc optional func configureBindings()
}


