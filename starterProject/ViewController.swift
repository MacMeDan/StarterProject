//
//  ViewController.swift
//  starterProject
//
//  Created by Dan Leonard on 10/26/17.
//  Copyright © 2017 Macmedan. All rights reserved.
//

import UIKit

extension UIViewController {
    func addCancelButtonLeft() {
        let button = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissView))
        button.accessibilityIdentifier = "Cancel"
        button.tintColor = .black
        navigationItem.leftBarButtonItem = button
    }
    
    func addDoneButtonLeft(tint: UIColor = .black) {
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissView))
        button.accessibilityIdentifier = "Cancel"
        button.tintColor = tint
        navigationItem.leftBarButtonItem = button
    }
    
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    func prepareNavigationController(style: UIStatusBarStyle, color: UIColor = .white, tint: UIColor = .black) {
        
        UIApplication.shared.statusBarStyle = style
        
        // remove the 1px bottom border of navigation the navigation controller.
        let _ = navigationController?.navigationBar.subviews.map { $0.subviews.map { if $0 is UIImageView {
            $0.removeFromSuperview() }
            }
        }
        navigationController?.navigationBar.tintColor = tint
        navigationController?.navigationBar.barTintColor = tint
        navigationController?.toolbar.backgroundColor = color
        navigationController?.navigationBar.isTranslucent = false
    }
    
    func prepareNavigation(style: UIStatusBarStyle = .default ,backgroundColor: UIColor = .white, textColor: UIColor = .black, barStyle: UIBarStyle = .default) {
        UIApplication.shared.statusBarStyle = .lightContent
        UINavigationBar.appearance().barStyle = .blackOpaque
        UINavigationBar.appearance().tintColor = textColor
        UINavigationBar.appearance().backgroundColor = backgroundColor
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : textColor]
    }
    
    public func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc public func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func settingsAlert(title: String = "Photo permissions not enabled", message: String = "Would you like to open settings to change them?") {
        let changeSetting = UIAlertController(title: title, message: message, preferredStyle: .alert)
        changeSetting.addAction(UIAlertAction(title: "Open Settings", style: .default, handler: { (UIAlertAction) -> Void in
            guard let url = URL(string: UIApplicationOpenSettingsURLString) else { return }
            if #available(iOS 10, *) { UIApplication.shared.open(url) }
            else { UIApplication.shared.openURL(url) }
        }))
        changeSetting.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        changeSetting.presentOnTop()
    }
}


