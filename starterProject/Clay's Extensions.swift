//
//  Clay's Extensions.swift
//  starterProject
//
//  Created by Dan Leonard on 10/26/17.
//  Copyright © 2017 Macmedan. All rights reserved.
//

import Foundation
//
//  UIView+Extras.swift
//  Clay Ellis
//  gist.github.com/clayellis/0cf1b1092b6a08cb4c5b2da9abee5ed9
//

import UIKit



extension UIView: ConfigurableView {}

/// `UIView` subclass that adds commonly used methods as overridable stubs
// I don't really use this class that often, but it shows how a typical UIView conforming to ConfigurableView should work.
open class View: UIView {
    
    deinit {
        stopObservingSizeCategoryNotifications()
    }
    
    /// Calls
    /// - `startObservingNotifications()`
    /// - `configureSubviews()`
    /// - `configureSizeCategorySubviews()`
    /// - `configureTraitableView(:)`
    /// - `configureLayout()`
    /// - `configureGestureRecognizers()`
    /// - `configureBindings()`
    /// - in that order
    ///
    /// `configure()` should be called from `init`
    open func configure() {
        startObservingSizeCategoryNotifications()
        configureSubviews()
        configureSizeCategorySubviews()
        configureTraitableViews(with: traitCollection)
        configureLayout()
        configureGestureRecognizers()
        configureBindings()
    }
    
    /// Adds `self` as an oberserver of the `UIContentSizeCategoryDidChange` notification
    ///
    /// When the notification is received `configureTraitableViews(with:)` is called with the new `UITraitCollection`.
    open func startObservingSizeCategoryNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(sizeCategoryDidChange), name: .UIContentSizeCategoryDidChange, object: nil)
    }
    
    @objc private func sizeCategoryDidChange() {
        configureSizeCategorySubviews()
    }
    
    /// Removes `self` as an observer of the `UIContentSizeCategoryDidChange` notification
    ///
    /// Called automatically from `deinit`.
    open func stopObservingSizeCategoryNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    /// Override point to configure subview appearances and properties
    open func configureSubviews() {}
    
    /// Override point to configure subview appearances and properties that are affected by size catgory changes
    open func configureSizeCategorySubviews() {}
    
    /// Override point to configure subview appearances and properties that are dependent on a `UITraitCollection`
    ///
    /// Standard behavior is to access and `switch` on `traitCollection.verticalSizeClass` cases `.vertical` and `.compact`.
    open func configureTraitableViews(with traitCollection: UITraitCollection) {}
    
    /// Override point to configure subview hierarchy, layout margins, and layouts
    open func configureLayout() {}
    
    /// Override point to configure gesture recognizers and add them to the appropriate subview
    open func configureGestureRecognizers() {}
    
    /// Override point to configure reactive bindings
    open func configureBindings() {}
    
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        configureTraitableViews(with: traitCollection)
    }
}

// MARK: - NSLayoutConstraint Convenience Methods

extension UIView {
    public func addAutoLayoutSubview(_ subview: UIView) {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func addAutoLayoutSubviews(_ subviews: UIView...) {
        subviews.forEach(addAutoLayoutSubview)
    }
    
    public func insertAutoLayoutSubview(_ view: UIView, at index: Int) {
        insertSubview(view, at: index)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func insertAutoLayoutSubview(_ view: UIView, belowSubview: UIView) {
        insertSubview(view, belowSubview: belowSubview)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func insertAutoLayoutSubview(_ view: UIView, aboveSubview: UIView) {
        insertSubview(view, aboveSubview: aboveSubview)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func exchangeSubview(_ subviewOne: UIView, with subviewTwo: UIView) {
        if let subviewOneIndex = indexOfSubview(subviewOne),
            let subviewTwoIndex = indexOfSubview(subviewTwo) {
            self.exchangeSubview(at: subviewOneIndex, withSubviewAt: subviewTwoIndex)
        }
    }
}

// MARK: - Layout Macros

extension UIView {
    public func activate(_ constraints: NSLayoutConstraint...) {
        NSLayoutConstraint.activate(constraints)
    }
    
    public func fillSuperview(priority p: UILayoutPriority = .required) {
        guard let superview = self.superview else { return }
        activate(
            leftAnchor.constraint(equalTo: superview.leftAnchor, priority: p),
            rightAnchor.constraint(equalTo: superview.rightAnchor, priority: p),
            topAnchor.constraint(equalTo: superview.topAnchor, priority: p),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, priority: p)
        )
    }
    
    @discardableResult
    public func fillSuperviewLayoutMargins(priority p: UILayoutPriority = .required) -> (left: NSLayoutConstraint, right: NSLayoutConstraint, top: NSLayoutConstraint, bottom: NSLayoutConstraint) {
        guard let superview = self.superview else {
            fatalError("\(self) has not been added as a subview")
        }
        let left = leftAnchor.constraint(equalTo: superview.leftMargin, priority: p)
        let right = rightAnchor.constraint(equalTo: superview.rightMargin, priority: p)
        let top = topAnchor.constraint(equalTo: superview.topMargin, priority: p)
        let bottom = bottomAnchor.constraint(equalTo: superview.bottomMargin, priority: p)
        activate(left, right, top, bottom)
        return (left, right, top, bottom)
    }
    
    public func centerInSupervew(priority p: UILayoutPriority = .required) {
        guard let superview = self.superview else { return }
        activate(
            centerXAnchor.constraint(equalTo: superview.centerXAnchor, priority: p),
            centerYAnchor.constraint(equalTo: superview.centerYAnchor, priority: p)
        )
    }
    
    public func centerInSupervewLayoutMargins(priority p: UILayoutPriority = .required) {
        guard let superview = self.superview else { return }
        activate(
            centerXAnchor.constraint(equalTo: superview.centerXMargin, priority: p),
            centerYAnchor.constraint(equalTo: superview.centerYMargin, priority: p)
        )
    }
}

// MARK: - Layout Margins Guide Shortcut

extension UIView {
    public var leftMargin: NSLayoutXAxisAnchor {
        return layoutMarginsGuide.leftAnchor
    }
    
    public var rightMargin: NSLayoutXAxisAnchor {
        return layoutMarginsGuide.rightAnchor
    }
    
    public var centerXMargin: NSLayoutXAxisAnchor {
        return layoutMarginsGuide.centerXAnchor
    }
    
    public var widthMargin: NSLayoutDimension {
        return layoutMarginsGuide.widthAnchor
    }
    
    public var topMargin: NSLayoutYAxisAnchor {
        return layoutMarginsGuide.topAnchor
    }
    
    public var bottomMargin: NSLayoutYAxisAnchor {
        return layoutMarginsGuide.bottomAnchor
    }
    
    public var centerYMargin: NSLayoutYAxisAnchor {
        return layoutMarginsGuide.centerYAnchor
    }
    
    public var heightMargin: NSLayoutDimension {
        return layoutMarginsGuide.heightAnchor
    }
}

// MARK: - Subview Retrieval

extension UIView {
    public var allSubviews: [UIView] {
        var all = subviews
        for subview in all {
            all.append(contentsOf: subview.allSubviews)
        }
        return all
    }
    
    public func subviewWithClassName(_ className: String) -> UIView? {
        return allSubviews.first { type(of: $0).description() == className }
    }
    
    public func subviewsWithClassName(_ className: String) -> [UIView] {
        return allSubviews.filter { type(of: $0).description() == className }
    }
    
    public func subviewWithClassType<T>(_ classType: T.Type) -> T? {
        return allSubviews.first { $0 is T } as? T
    }
    
    public func subviewsWithClassType<T>(_ classType: T.Type) -> [T] {
        return allSubviews.map { $0 as? T }.flatMap { $0 }
    }
    
    public func indexOfSubview(_ subview: UIView) -> Int? {
        return subviews.index(of: subview)
    }
    
    public var currentFirstResponder: UIResponder? {
        if isFirstResponder {
            return self
        }
        
        for view in self.subviews {
            if let responder = view.currentFirstResponder {
                return responder
            }
        }
        
        return nil
    }
    
////     Useful, but commenting out to avoid warnings
//        func printRecursiveDescription() {
//            print(perform("recursiveDescription"))
//        }
//    
//        func printAutolayoutTrace() {
//            print(perform("_autolayoutTrace"))
//        }
}

// MARK: - UIStackView

public extension UIStackView {
    func addArrangedSubviews(_ subviews: UIView...) {
        subviews.forEach(addArrangedSubview)
    }
}

// MARK: - Animations

public extension UIView {
    public func shake(withDuration duration: TimeInterval = 0.6) {
        let shake = CAKeyframeAnimation(keyPath: "transform.translation.x")
        shake.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        shake.duration = duration
        shake.values = [-12, 12, -12, 12, -6, 6, -3, 3, 0]
        layer.add(shake, forKey: "Shake")
    }
    
    public func flash(withDuration duration: TimeInterval = 0.6) {
        let flash = CAKeyframeAnimation(keyPath: "opacity")
        flash.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        flash.duration = duration
        flash.values = [1, 0, 1, 0, 1]
        layer.add(flash, forKey: "Flash")
    }
}

// MARK: - Constraint + Priority


