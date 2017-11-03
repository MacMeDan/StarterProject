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
        button.tintColor = .tint
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
}


