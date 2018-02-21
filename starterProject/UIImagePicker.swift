//
//  UIImagePicker.swift
//  starterProject
//
//  Created by Dan Leonard on 10/26/17.
//  Copyright © 2017 Macmedan. All rights reserved.
//

import UIKit
import AVFoundation

/// - Tag: ImagePicker
// MARK: - UIImagePickerControllerDelegate Methods
extension UIViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func pickPhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            showPhotoMenu()
        } else {
            choosePhotoFromLibrary()
        }
    }
    
    func showPhotoMenu() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let takePhotoAction = UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.takePhotoWithCamera()
        })
        let chooseFromLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: { _ in
            self.choosePhotoFromLibrary()
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(takePhotoAction)
        alertController.addAction(chooseFromLibraryAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func takePhotoWithCamera() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func choosePhotoFromLibrary() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func newImgTapped(sender: UIButton) {
        let imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        let status = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        if status == AVAuthorizationStatus.denied {
            
            let changeSetting = UIAlertController(title: "Update Settings", message: "You will need to change this in setting in order to proceed", preferredStyle: .alert)
            changeSetting.addAction(UIAlertAction(title: "Open Settings", style: .default, handler: { (UIAlertAction) -> Void in
                guard let url = URL(string: UIApplicationOpenSettingsURLString) else {return}
                UIApplication.shared.open(url)
            }))
            changeSetting.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            changeSetting.presentOnTop()
            
        } else {
            let Alert = UIAlertController(title: "Select Source?", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
            Alert.popoverPresentationController?.sourceRect = sender.bounds
            Alert.popoverPresentationController?.sourceView = sender
            
            imgPicker.allowsEditing = true
            imgPicker.modalPresentationStyle = UIModalPresentationStyle.popover
            imgPicker.popoverPresentationController?.sourceView = sender
            imgPicker.popoverPresentationController?.sourceRect = sender.bounds
        
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            Alert.addAction(UIAlertAction(title: "Camera", style: .default) { (camera) -> Void in
                imgPicker.sourceType = .camera
                self.present(imgPicker, animated: true, completion: nil)
            })}
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            Alert.addAction(UIAlertAction(title: " Library", style: .default) { (Photolibrary) -> Void in
                imgPicker.sourceType = .photoLibrary
                self.present(imgPicker, animated: true, completion: nil)
            })}
            Alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            Alert.presentOnTop()
        }
    }
    
    public func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
