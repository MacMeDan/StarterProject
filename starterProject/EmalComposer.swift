//
//  EmalComposer.swift
//  starterProject
//
//  Created by Dan Leonard on 11/14/17.
//  Copyright © 2017 Macmedan. All rights reserved.
//

import Foundation
import MessageUI

class EmailComposer: NSObject, MFMailComposeViewControllerDelegate {
    static let shared = EmailComposer()
    
    func canEmail() -> Bool {
        return MFMailComposeViewController.canSendMail()
    }
    
    func composeEmailController(email: String?) -> UIViewController {
        if let email = email {
            if canEmail() {
                let emailComposeVC = MFMailComposeViewController()
                emailComposeVC.mailComposeDelegate = self
                emailComposeVC.setToRecipients([email])
                return emailComposeVC
            } else {
                return emailErrorAlert()
            }
        } else {
            return NoNumberAlert()
        }
    }
    
    func support() -> UIViewController {
        if canEmail() {
            let emailComposeVC = MFMailComposeViewController()
            emailComposeVC.mailComposeDelegate = self
            emailComposeVC.setToRecipients(["support@skipio.com"])
            let version = Bundle.main.releaseVersionNumber ?? "UNKNOWN"
            let build = Bundle.main.buildVersionNumber ?? "UNKNOWN"
//            let name = AccountInfo.name ?? "UNKNOWN"
//            let id = AccountInfo.id ?? "UNKNOWN"
            let body = "Description of problem:\n\n Steps to reproduce: \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n - - - - - - - - - \n App Version:  \(version) \n Build: \(build)\n "//id: \(id) \n Name: \(name) \n- - - - - - - - - - - - - - - - "
            emailComposeVC.setMessageBody(body, isHTML: false)
            
            return emailComposeVC
        } else {
            return emailErrorAlert()
        }
    }
    
    //Mark: Mail Delegate Methods
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func emailErrorAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Error", message: "To send an email please add an account to this device.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        return alert
    }
    
    private func NoNumberAlert() -> UIAlertController {
        let alert = UIAlertController(title: "No Number", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
    }
}
